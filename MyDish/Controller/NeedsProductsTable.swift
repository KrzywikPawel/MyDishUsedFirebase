//
//  NeedsProductsTable.swift
//  MyDish
//
//  Created by Pawel Krzywik on 09/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
import UIKit
extension DishProductViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == ingredientsTable{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NeedProductsTableViewCell", for: indexPath) as! NeedProductsTableViewCell
            cell.quantityLabel.text = quantityProducts[indexPath.row]
            cell.quantityLabel.textColor = .systemGray
            cell.quantityLabel.font = cell.quantityLabel.font.withSize(14)
            cell.productNameLabel.text = productsArray[indexPath.row]
            cell.productNameLabel.font = UIFont.boldSystemFont(ofSize: 14)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DirectionsTableViewCell", for: indexPath) as! DirectionsTableViewCell
        cell.nrStepsLbl.text = "elko"
        cell.directionLbl.text = "siema"
        return cell
    }
    
}
