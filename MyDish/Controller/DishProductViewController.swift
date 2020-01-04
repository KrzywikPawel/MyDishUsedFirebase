//
//  DishProductViewController.swift
//  MyDish
//
//  Created by Pawel Krzywik on 02/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit
//MARK: refactor this view? (use container view)
class DishProductViewController: UIViewController {
    @IBOutlet weak var directionTable: UITableView!
    @IBOutlet weak var ingredientsTable: UITableView!
    @IBOutlet weak var shopListBtn: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cookLaterBtn: UIButton!
    @IBOutlet weak var ingredientsLbl: UILabel!
    @IBOutlet weak var directionsLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var cookingTimeLbl: UILabel!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var img: UIImageView!
    
    var time: String = ""
    var name:String = ""
    var imgName: String = ""
    var id: Int = 0
    
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
        leftBarBtnItem()
        
        timeView.layer.borderWidth = 1
        timeView.layer.borderColor = UIColor.systemGray.cgColor
        timeView.layer.cornerRadius = 10
        
        //method takeData?
        let takeData = TakePropertiesData()
        let properties = takeData.takeProperties(id: id)
        productsArray = properties.products
        quantityProducts = properties.quantity
        directions = properties.steps
        
        //method set lbl
        nameLabel.text = name
        nameLabel.font = UIFont.boldSystemFont(ofSize: 19)
        ingredientsLbl.text = "Ingredients"
        ingredientsLbl.font = UIFont.boldSystemFont(ofSize: 19)
        directionsLbl.text = "Directions"
        directionsLbl.font = UIFont.boldSystemFont(ofSize: 19)
        
        time = "\(time) MIN"
        timeLbl.text = time
        timeLbl.font = UIFont.boldSystemFont(ofSize: 19)
        cookingTimeLbl.font = cookingTimeLbl.font.withSize(15)
        cookingTimeLbl.textColor = .systemGray
        
        //  delete extra empty cell
        ingredientsTable.tableFooterView = UIView()
        directionTable.tableFooterView = UIView()
        
        img.image = UIImage(named: imgName)
        
        
        cookLaterBtn.addTarget(self, action: #selector(cookLater), for: .touchUpInside)
        shopListBtn.addTarget(self, action: #selector(addToShopList), for: .touchUpInside)
        
        //MARK: change this cellxib for normal cell in storyboard
        let cellNibNeedsProduct = UINib(nibName: "NeedProductsTableViewCell", bundle: nil)
        ingredientsTable.register(cellNibNeedsProduct, forCellReuseIdentifier: "NeedProductsTableViewCell")
    }
    
    private func leftBarBtnItem() {
        let backbtn = UIButton(type: .custom)
        backbtn.setImage(UIImage(named: "back"), for: .normal)
        backbtn.addTarget(self, action: #selector(backToMainCollection(sender:)), for: .touchUpInside)
        backbtn.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        let leftItem = UIBarButtonItem(customView: backbtn)
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    @objc private func backToMainCollection(sender: UIButton){
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
