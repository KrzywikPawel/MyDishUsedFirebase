//
//  DishProductViewController.swift
//  MyDish
//
//  Created by Pawel Krzywik on 02/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit

class DishProductViewController: UIViewController {
    
    @IBOutlet weak var shopListBtn: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    var name:String = ""
    var id: Int = 0
    var imgArray = [String]()
    var productsArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        let takeData = TakePropertiesData()
        let properties = takeData.takeProperties(id: id)
        imgArray = properties.img
        productsArray = properties.products
        shopListBtn.addTarget(self, action: #selector(addToShopList), for: .touchUpInside)
    }
    
    @objc private func addToShopList(){
        let addToShopList = ShopListDataStruct(id, name, productsArray)
        var array = ShopListStructInCache.get()
        array.append(addToShopList)
        ShopListStructInCache.save(array)
    }
    
}
