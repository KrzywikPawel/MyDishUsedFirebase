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
        if headerName.count == 0{
            let setMessage = SetEmptyTableAndCollectionMessage()
            setMessage.tableSetEmptyMessage(tableView, emptyMessage)
        }else{
            tableView.restore()
        }
        return headerName.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderSectionView") as! HeaderSectionView
        headerView.backgroundColor = .systemGray6
        headerView.nameLbl.text = headerName[section]
        headerView.nameLbl.font = UIFont.boldSystemFont(ofSize: 16)
        headerView.deleteBtn.setImage(UIImage(named: "delete"), for: .normal)
        headerView.deleteBtn.tag = section
        headerView.deleteBtn.addTarget(self, action: #selector(deleteDishInShopList(sender:)), for: .touchUpInside)
        return headerView;
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopListTableViewCell", for: indexPath) as! ShopListTableViewCell
        cell.layer.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 90)
        cell.configurateWithItem(quantityProduct[indexPath.section][indexPath.row], shopList[indexPath.section][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath, tableView: tableView)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
}





