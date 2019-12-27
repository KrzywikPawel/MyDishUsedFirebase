//
//  ShopListViewController.swift
//  MyDish
//
//  Created by Pawel Krzywik on 15/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit

class ShopListViewController: UIViewController {
    var shopListStruct = [ShopListDataStruct]()
    var shopList = [[String]]()
    var headerName = [String]()
    @IBOutlet weak var productsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let idCell = "NeedProductsTableViewCell"
        let cellNib = UINib(nibName: idCell, bundle: nil)
        productsTableView.register(cellNib, forCellReuseIdentifier: idCell)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(addTapped))
        let idHeader = "HeaderSectionView"
        let headerNIB = UINib(nibName: idHeader, bundle: Bundle.main)
        productsTableView.register(headerNIB, forHeaderFooterViewReuseIdentifier: idHeader)
    }
    
    @objc private func addTapped()  {
        ShopListStructInCache.clear()
        viewWillAppear(false)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        headerName = [String]()
        shopList = [[String]]()
        shopListStruct = ShopListStructInCache.get()
        for item in shopListStruct{
            headerName.append(item.name)
            shopList.append(item.products)
        }
        productsTableView.reloadData()
    }
}
