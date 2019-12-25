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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderSectionView") as! HeaderSectionView
        headerView.backgroundColor = .lightGray
        headerView.nameLabel.text = headerName[section]
        headerView.deleteBtn.setImage(UIImage(named: "delete"), for: .normal)
        headerView.deleteBtn.tag = section
        headerView.deleteBtn.addTarget(self, action: #selector(deleteDishInShopList(sender:)), for: .touchUpInside)
        return headerView;
    }
    
    @objc private func deleteDishInShopList(sender: UIButton){
        let sectionId = sender.tag
        headerName.remove(at: sectionId)
        shopList.remove(at: sectionId)
        let shopListStruct = ShopListStructInCache()
        shopListStruct.delete(index: sectionId)
        productsTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NeedProductsTableViewCell", for: indexPath) as! NeedProductsTableViewCell
        cell.productLabel.text = shopList[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath, tableView: tableView)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    private func deleteAction(at indexPath:IndexPath,tableView: UITableView) -> UIContextualAction {
        var sectionWithDeleteProduct = self.shopList[indexPath.section]
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action,view,completion) in
            sectionWithDeleteProduct.remove(at: indexPath.row)
            self.shopList[indexPath.section] = sectionWithDeleteProduct
            tableView.deleteRows(at: [indexPath], with: .automatic)
            if(sectionWithDeleteProduct.count == 0){
                self.shopList.remove(at: indexPath.section)
                self.headerName.remove(at: indexPath.section)
                let indexSet = IndexSet(arrayLiteral: indexPath.section)
                tableView.deleteSections(indexSet, with: .automatic)
                self.shopListStruct.remove(at: indexPath.section)
                ShopListStructInCache.save(self.shopListStruct)
            }else{
                self.shopListStruct[indexPath.section].products = sectionWithDeleteProduct
                ShopListStructInCache.save(self.shopListStruct)
            }
        }
        action.image = UIImage(named: "delete")
        action.backgroundColor = .red
        self.shopListStruct[indexPath.section].products = sectionWithDeleteProduct
        ShopListStructInCache.save(shopListStruct)
        return action
    }
}
