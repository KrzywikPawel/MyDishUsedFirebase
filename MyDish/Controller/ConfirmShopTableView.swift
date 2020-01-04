//
//  ConfirmShopTableView.swift
//  MyDish
//
//  Created by Pawel Krzywik on 04/01/2020.
//  Copyright © 2020 Pawel Krzywik. All rights reserved.
//

import Foundation
import UIKit

extension ConfirmShopListViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmShopListTableViewCell", for: indexPath) as! ConfirmShopListTableViewCell
        cell.quantityLbl.text = quantityProduct[indexPath.row]
        cell.nameLbl.text = products[indexPath.row]
        return cell
    }
    
    
    
}
