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
    
    init(arrayDish: [Dish]) {
        self.arrayDish = arrayDish
    }
    init(dish: Dish){
        arrayDish.append(dish)
    }
    
   private let circleFill = UIImage(systemName: "circle.fill")
   private let circle = UIImage(systemName: "circle")
    
   private func setColourLvlCircle(_ cell: MainCollectionViewCell) {
        cell.buttonLvl1.tintColor = .systemGreen
        cell.buttonLvl2.tintColor = .orange
        cell.buttonLvl3.tintColor = .red
    }
    
    private func levelCustomization(_ indexPath: IndexPath, _ cell: MainCollectionViewCell, _ lvl:Int) {
        switch lvl {
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
    
    func customizeAttributedCell(_ indexPath: IndexPath, _ cell: MainCollectionViewCell, _ min:String, _ lvl:Int) {
        let attributedString = NSMutableAttributedString(string: min)
        let range = NSRange(location: 3, length: 3)
        attributedString.setAttributes([NSAttributedString.Key.baselineOffset: 8], range: range)
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: range)
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17), range: NSRange(location: 0, length: 2))
        cell.timeLabel.attributedText = attributedString
        levelCustomization(indexPath, cell,lvl)
    }
}
