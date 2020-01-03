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
    var time: String = ""
    var directions = [String]()
    var name:String = ""
    @IBOutlet weak var img: UIImageView!
    var imgName: String = ""
    var id: Int = 0
    var productsArray = [String]()
    var quantityProducts = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        timeView.layer.borderWidth = 1
        timeView.layer.borderColor = UIColor.systemGray.cgColor
        timeView.layer.cornerRadius = 10
        nameLabel.text = name
        nameLabel.font = UIFont.boldSystemFont(ofSize: 19)
        ingredientsLbl.text = "Ingredients"
        ingredientsLbl.font = UIFont.boldSystemFont(ofSize: 19)
        directionsLbl.text = "Directions"
        directionsLbl.font = UIFont.boldSystemFont(ofSize: 19)
        ingredientsTable.tableFooterView = UIView()
        directionTable.tableFooterView = UIView()
        let takeData = TakePropertiesData()
        let properties = takeData.takeProperties(id: id)
        productsArray = properties.products
        quantityProducts = properties.quantity
        directions = properties.steps
        timeLbl.text = "\(time)min"
        timeLbl.font = UIFont.boldSystemFont(ofSize: 19)
        cookingTimeLbl.font = cookingTimeLbl.font.withSize(15)
        cookingTimeLbl.textColor = .systemGray
        img.image = UIImage(named: imgName)
        //MARK: change this cellxib for normal cell in storyboard
        let cellNibNeedsProduct = UINib(nibName: "NeedProductsTableViewCell", bundle: nil)
        ingredientsTable.register(cellNibNeedsProduct, forCellReuseIdentifier: "NeedProductsTableViewCell")
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
//        left swipe gestures to back previous controller (after change leftbarimage gesture       doesnt work without this)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        leftBarBtnItem()
        shopListBtn.addTarget(self, action: #selector(addToShopList), for: .touchUpInside)
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

    @objc private func addToShopList(){
        let addToShopList = ShopListDataStruct(id, name, productsArray)
        var array = ShopListStructInCache.get()
        array.append(addToShopList)
        ShopListStructInCache.save(array)
    }
    
}
