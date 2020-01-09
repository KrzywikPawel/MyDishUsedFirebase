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
            let quantity = quantityProducts[indexPath.row]
            let nameProduct = productsArray[indexPath.row]
            cell.configurateWithItem(quantity: quantity, name: nameProduct)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DirectionsTableViewCell
        let stepNr = indexPath.row+1
        let direction = "\(directions[indexPath.row])"
        cell.configurateWithItem(step: stepNr, direction: direction)
        return cell
    }
    
}
