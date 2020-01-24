//
//  ConfirmShopListViewController.swift
//  MyDish
//
//  Created by Pawel Krzywik on 04/01/2020.
//  Copyright © 2020 Pawel Krzywik. All rights reserved.
//

import UIKit

class ConfirmShopListViewController: UIViewController {
    
    @IBOutlet var setView: ConfirmShopList!
    
    var quantityProduct = [String]()
    var products = [String]()
    var arraySavedQuantity = [String]()
    var arraySavedProducts = [String]()
    var name = String()
    var id = Int()
    var deletePosition = String()
    @IBOutlet weak var confirmTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arraySavedProducts = products
        arraySavedQuantity = quantityProduct
        customizeNavigationBar()
        
//        view
        confirmTable.tableFooterView = UIView()
        confirmTable.backgroundColor = .systemGray6
        self.view.backgroundColor = .systemGray6
    }
    
    private func customizeNavigationBar() {
        let backBtn = UIButton(type: .custom)
        customizeBackBtn(backBtn)
        let leftItem = UIBarButtonItem(customView: backBtn)
        self.navigationItem.leftBarButtonItem = leftItem
        
//        view
        self.title = "Review Ingredients"
    }
    
//    view
    private func customizeBackBtn(_ backBtn: UIButton) {
         backBtn.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
         backBtn.setImage(UIImage(named: "back"), for: .normal)
         backBtn.addTarget(self, action: #selector(backToView(sender:)), for: .touchUpInside)
     }
    
//    view

    @objc private func backToView(sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func confirm(_ sender: UIButton) {
        if arraySavedProducts.isEmpty{
        }else{
            let shopList = ShopListDataStruct()
            shopList.id = id
            shopList.name = name
            shopList.products = arraySavedProducts
            shopList.quantity = arraySavedQuantity
            var array = ShopListStructInCache.get()
            if array.contains(where: {$0.id == id}){
            // try add product list which already is added
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
