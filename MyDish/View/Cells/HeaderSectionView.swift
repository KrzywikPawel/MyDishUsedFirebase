//
//  HeaderSectionView.swift
//  MyDish
//
//  Created by Pawel Krzywik on 25/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit

protocol  deleteBtnAction: class {
    func deleteBtnAction(_ sender: UIButton)
}

class HeaderSectionView: UITableViewHeaderFooterView {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    
    weak var delegate: deleteBtnAction?
    func configurateWithItem(_ headerName: String, _ imgName: String, tag: Int){
        nameLbl.text = headerName
        nameLbl.font = UIFont.boldSystemFont(ofSize: 16)
        deleteBtn.setImage(UIImage(named: imgName), for: .normal)
        self.backgroundColor = .systemGray6
        deleteBtn.tag = tag
    }
    
    @IBAction func deleteBtnAction(_ sender: UIButton) {
        delegate?.deleteBtnAction(sender)
    }
}
