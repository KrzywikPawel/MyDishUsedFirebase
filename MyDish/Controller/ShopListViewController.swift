//
//  ShopListViewController.swift
//  MyDish
//
//  Created by Pawel Krzywik on 15/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit

class ShopListViewController: UIViewController {
    var shopList = [[String]]()
    var headerName = [String]()
    @IBOutlet weak var productsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "NeedProductsTableViewCell", bundle: nil)
        productsTableView.register(cellNib, forCellReuseIdentifier: "NeedProductsTableViewCell")
        shopList.append(["ser","maslo"])
        shopList.append(["kawa","tosty,","ryba"])
        headerName.append("jedna")
        headerName.append("druga")
    }
}
