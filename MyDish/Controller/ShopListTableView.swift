//
//  ShopListTableView.swift
//  MyDish
//
//  Created by Pawel Krzywik on 15/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
import UIKit

extension ShopListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopList[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerName.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerName[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NeedProductsTableViewCell", for: indexPath) as! NeedProductsTableViewCell
        cell.productLabel.text = shopList[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath, tableView: tableView)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    private func deleteAction(at indexPath:IndexPath,tableView: UITableView) -> UIContextualAction {
        var sectionWithDeleteProduct = self.shopList[indexPath.section]
        
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action,view,completion) in
            sectionWithDeleteProduct.remove(at: indexPath.row)
            print(sectionWithDeleteProduct.count)
            self.shopList[indexPath.section] = sectionWithDeleteProduct
            tableView.deleteRows(at: [indexPath], with: .automatic)
            print(sectionWithDeleteProduct.count)
            if(sectionWithDeleteProduct.count == 0){
                let indexSet = IndexSet(arrayLiteral: indexPath.section)
                self.shopList.remove(at: indexPath.section)
                self.headerName.remove(at: indexPath.section)
                tableView.deleteSections(indexSet, with: .automatic)
                self.shopListStruct[indexPath.section].products = sectionWithDeleteProduct
                self.shopListStruct[indexPath.section].name = ""
                ShopListStructInCache.save(self.shopListStruct)
            }else{
            self.shopListStruct[indexPath.section].products = sectionWithDeleteProduct
            ShopListStructInCache.save(self.shopListStruct)
            }
        }
        action.image = UIImage(named: "delete")
        action.backgroundColor = .red
        //        print(sectionWithDeleteProduct.count)
        self.shopListStruct[indexPath.section].products = sectionWithDeleteProduct
        ShopListStructInCache.save(shopListStruct)
        return action
    }
}
