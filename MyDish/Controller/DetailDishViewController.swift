//
//  DishProductViewController.swift
//  MyDish
//
//  Created by Pawel Krzywik on 02/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit
//MARK: refactor this view? (use container view)
class DetailDishViewController: UIViewController {
    @IBOutlet var setView: DetailDishView!
    
    var time: String = ""
    var name:String = ""
    var imgName: String = ""
    var id: Int = 0
    
    var directions = [String]()
    var productsArray = [String]()
    var quantityProducts = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView.setNavigation(self.navigationController!)
        //method takeData
        let takeData = TakePropertiesData()
        let properties = takeData.takeProperties(id: id)
        productsArray = properties.products
        quantityProducts = properties.quantity
        directions = properties.steps
        setView.setNameLbl(name)
        setView.setTimeLbl(time)
        setView.setImg(imgName)
        //        setView.leftBarBtnItem(self.navigationItem)
        leftBarBtnItem()
        setView.cookLaterBtn.addTarget(self, action: #selector(cookLater), for: .touchUpInside)
        setView.shopListBtn.addTarget(self, action: #selector(addToShopList), for: .touchUpInside)
    }
    
//     it is view ?
    func leftBarBtnItem() {
        let backbtn = UIButton(type: .custom)
        backbtn.setImage(UIImage(named: "back"), for: .normal)
        backbtn.addTarget(self, action: #selector(backToMainCollection(sender:)), for: .touchUpInside)
        backbtn.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        let leftItem = UIBarButtonItem(customView: backbtn)
        navigationItem.leftBarButtonItem = leftItem
    }
    
    
    @objc func backToMainCollection(sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func cookLater(){
        let defaults = UserDefaults.standard
        var arrayLaterCookDishes = defaults.array(forKey: "arrayCookLater")  as? [Int] ?? [Int]()
        if arrayLaterCookDishes.contains(id){
        }else{
            arrayLaterCookDishes.append(id)
        }
        defaults.set(arrayLaterCookDishes, forKey: "arrayCookLater")
    }
    
    @objc private func addToShopList(){
        let addToShopList = ShopListDataStruct(id, name, productsArray,quantityProducts)
        var array = ShopListStructInCache.get()
        array.append(addToShopList)
        ShopListStructInCache.save(array)
    }
}
