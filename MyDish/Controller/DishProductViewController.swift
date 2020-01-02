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
    @IBOutlet weak var img: UIImageView!
    var imgName: String = ""
    var id: Int = 0
    var productsArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        let takeData = TakePropertiesData()
        let properties = takeData.takeProperties(id: id)
        productsArray = properties.products
        img.image = UIImage(named: imgName)
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
