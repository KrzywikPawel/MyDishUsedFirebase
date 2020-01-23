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
    //    @IBOutlet weak var directionTable: UITableView!
    //    @IBOutlet weak var ingredientsTable: UITableView!
    //    @IBOutlet weak var shopListBtn: UIButton!
    //    @IBOutlet weak var nameLabel: UILabel!
    //    @IBOutlet weak var cookLaterBtn: UIButton!
    //    @IBOutlet weak var ingredientsLbl: UILabel!
    //    @IBOutlet weak var directionsLbl: UILabel!
    //    @IBOutlet weak var timeLbl: UILabel!
    //    @IBOutlet weak var cookingTimeLbl: UILabel!
    //    @IBOutlet weak var timeView: UIView!
    //    @IBOutlet weak var img: UIImageView!
    var time: String = ""
    var name:String = ""
    var imgName: String = ""
    var id: Int = 0
    @IBOutlet var setView: DetailDishView!
    
    var directions = [String]()
    var productsArray = [String]()
    var quantityProducts = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        //  left swipe gestures to back previous controller (after change leftbarimage gesture  doesnt work without this)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        //method takeData
        let takeData = TakePropertiesData()
        let properties = takeData.takeProperties(id: id)
        productsArray = properties.products
        quantityProducts = properties.quantity
        directions = properties.steps
        setView.setNameLbl(name)
        setView.setTimeLbl(time)
        setView.setImg(imgName)
        leftBarBtnItem()
        setView.cookLaterBtn.addTarget(self, action: #selector(cookLater), for: .touchUpInside)
        setView.shopListBtn.addTarget(self, action: #selector(addToShopList), for: .touchUpInside)
    }
    
    private func leftBarBtnItem() {
        let backbtn = UIButton(type: .custom)
        backbtn.setImage(UIImage(named: "back"), for: .normal)
        backbtn.addTarget(self, action: #selector(backToMainCollection(sender:)), for: .touchUpInside)
        backbtn.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        let leftItem = UIBarButtonItem(customView: backbtn)
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    @objc  func backToMainCollection(sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc  func cookLater(){
        let defaults = UserDefaults.standard
        var arrayLaterCookDishes = defaults.array(forKey: "arrayCookLater")  as? [Int] ?? [Int]()
        if arrayLaterCookDishes.contains(id){
        }else{
            arrayLaterCookDishes.append(id)
        }
        defaults.set(arrayLaterCookDishes, forKey: "arrayCookLater")
    }
    
    @objc  func addToShopList(){
        let addToShopList = ShopListDataStruct(id, name, productsArray,quantityProducts)
        var array = ShopListStructInCache.get()
        array.append(addToShopList)
        ShopListStructInCache.save(array)
    }
}
