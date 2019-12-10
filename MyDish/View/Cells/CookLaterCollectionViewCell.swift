//
//  CookLaterCollectionViewCell.swift
//  MyDish
//
//  Created by Pawel Krzywik on 09/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit

class CookLaterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var btnLvl1: UIButton!
    @IBOutlet weak var btnLvl2: UIButton!
    @IBOutlet weak var btnLvl3: UIButton!
    
    @IBOutlet weak var deleteBtn: UIButton!
    
}
