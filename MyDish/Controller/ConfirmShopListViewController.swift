//
//  ConfirmShopListViewController.swift
//  MyDish
//
//  Created by Pawel Krzywik on 04/01/2020.
//  Copyright © 2020 Pawel Krzywik. All rights reserved.
//

import UIKit

class ConfirmShopListViewController: UIViewController {
    var quantityProduct = [String]()
    var products = [String]()
    var arraySavedQuantity = [String]()
    var arraySavedProducts = [String]()
    var name = String()
    var id = Int()
    var deletePosition = String()
    @IBOutlet weak var confirmTable: UITableView!
    @IBOutlet weak var confirmBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // na oryginale czy kopii?
        arraySavedProducts = products
        arraySavedQuantity = quantityProduct
        customizeNavigationBar()
        confirmTable.tableFooterView = UIView()
        confirmTable.backgroundColor = .systemGray6
        self.view.backgroundColor = .systemGray6
    }
    
    private func customizeNavigationBar() {
        customizeConfirmBtn()
        let backBtn = UIButton(type: .custom)
        customizeBackBtn(backBtn)
        let leftItem = UIBarButtonItem(customView: backBtn)
        self.navigationItem.leftBarButtonItem = leftItem
        self.title = "Review Ingredients"
    }
    
    private func customizeBackBtn(_ backBtn: UIButton) {
         backBtn.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
         backBtn.setImage(UIImage(named: "back"), for: .normal)
         backBtn.addTarget(self, action: #selector(backToView(sender:)), for: .touchUpInside)
     }
    
    private func customizeConfirmBtn() {
          confirmBtn.setTitle("Confirm", for: .normal)
          confirmBtn.setTitleColor(UIColor.systemGreen, for: .normal)
          confirmBtn.backgroundColor = .black
          confirmBtn.layer.cornerRadius = 20
          confirmBtn.layer.borderWidth = 1
      }
    
    @objc private func backToView(sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func confirm(_ sender: UIButton) {
        if arraySavedProducts.isEmpty{
        }else{
            let shopList = ShopListDataStruct()
            shopList.id = id
            shopList.name = name
            shopList.products = arraySavedProducts
            shopList.quantity = arraySavedQuantity
            var array = ShopListStructInCache.get()
            if array.contains(where: {$0.id == id}){
                ////            trying add product list which already is added
            }else{
                array.append(shopList)
                ShopListStructInCache.save(array)
            }
            let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let shopListVc = storyboard.instantiateViewController(identifier: "ShopListViewController") as! ShopListViewController
            shopListVc.navigationItem.setHidesBackButton(true, animated: false)
            self.navigationController?.pushViewController(shopListVc, animated: true)
        }
    }
    
}
