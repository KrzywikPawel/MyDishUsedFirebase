//
//  ConfirmShopList.swift
//  MyDish
//
//  Created by Pawel Krzywik on 24/01/2020.
//  Copyright © 2020 Pawel Krzywik. All rights reserved.
//

import Foundation
import UIKit

class ConfirmShopList: UIView{
    
    @IBOutlet weak var confirmBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeConfirmBtn()
    }
    
    private func customizeConfirmBtn() {
        confirmBtn.setTitle("Confirm", for: .normal)
        confirmBtn.setTitleColor(UIColor.systemGreen, for: .normal)
        confirmBtn.backgroundColor = .black
        confirmBtn.layer.cornerRadius = 20
        confirmBtn.layer.borderWidth = 1
        let vc = ConfirmShopListViewController()
        confirmBtn.addTarget(vc, action: #selector(vc.confirm(_:)) , for: .touchUpInside)

    }
    
}
