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
        if (tableView == ingredientsTable){
        return productsArray.count
        }
        return directions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (tableView == ingredientsTable){
            let cell = tableView.dequeueReusableCell(withIdentifier: "NeedProductsTableViewCell", for: indexPath) as! NeedProductsTableViewCell
            cell.quantityLabel.text = quantityProducts[indexPath.row]
            cell.quantityLabel.textColor = .systemGray
            cell.quantityLabel.font = cell.quantityLabel.font.withSize(14)
            cell.productNameLabel.text = productsArray[indexPath.row]
            cell.productNameLabel.font = UIFont.boldSystemFont(ofSize: 14)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DirectionsTableViewCell
        cell.nrStepsLbl.text = "Step \(indexPath.row+1)"
        cell.nrStepsLbl.font = cell.nrStepsLbl.font.withSize(13)
        cell.nrStepsLbl.textColor = .systemGray
        cell.directionLbl.text = "\(directions[indexPath.row])"
        return cell
    }
    
}
