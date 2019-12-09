//
//  CustomizeMainDescription.swift
//  MyDish
//
//  Created by Pawel Krzywik on 01/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
import UIKit

class CustomizeMainDescription{
    private var arrayDish: [Dish] = []
    init(dish: [Dish]) {
        arrayDish = dish
    }
    
   private let circleFill = UIImage(systemName: "circle.fill")
   private let circle = UIImage(systemName: "circle")
    
   private func setColourLvlCircle(_ cell: MainDishCollectionViewCell) {
        cell.buttonLvl1.tintColor = .systemGreen
        cell.buttonLvl2.tintColor = .orange
        cell.buttonLvl3.tintColor = .red
    }
    
    func levelCustomization(_ indexPath: IndexPath, _ cell: MainDishCollectionViewCell) {
        switch arrayDish[indexPath.row].level {
        case 1:
            setColourLvlCircle(cell)
            cell.buttonLvl1.setImage(circleFill, for: .normal)
            cell.buttonLvl2.setImage(circle, for: .normal)
            cell.buttonLvl3.setImage(circle, for: .normal)
        case 2:
            setColourLvlCircle(cell)
            cell.buttonLvl1.setImage(circleFill, for: .normal)
            cell.buttonLvl2.setImage(circleFill, for: .normal)
            cell.buttonLvl3.setImage(circle, for: .normal)
        case 3:
            setColourLvlCircle(cell)
            cell.buttonLvl1.setImage(circleFill, for: .normal)
            cell.buttonLvl2.setImage(circleFill, for: .normal)
            cell.buttonLvl3.setImage(circleFill, for: .normal)
        default:
            print("nil")
        }
    }
    
}