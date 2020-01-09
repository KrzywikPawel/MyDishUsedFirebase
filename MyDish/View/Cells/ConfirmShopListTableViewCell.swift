//
//  ConfirmShopListTableViewCell.swift
//  MyDish
//
//  Created by Pawel Krzywik on 04/01/2020.
//  Copyright © 2020 Pawel Krzywik. All rights reserved.
//

import UIKit

class ConfirmShopListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var quantityLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var checkBtn: UIButton!
    
    func configurateWithItem(_ quantity: String,_ name: String){
        layer.borderWidth = 5
        layer.borderColor = UIColor.systemGray6.cgColor
        quantityLbl.font = UIFont.boldSystemFont(ofSize: 17)
        quantityLbl.text = quantity
        nameLbl.text = name
        nameLbl.font = UIFont.boldSystemFont(ofSize: 17)
        checkBtn.tintColor = .systemGreen
    }



}
