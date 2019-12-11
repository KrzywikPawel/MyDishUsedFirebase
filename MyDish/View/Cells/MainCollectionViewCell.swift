//
//  MainCollectionViewCell.swift
//  MyDish
//
//  Created by Pawel Krzywik on 11/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var buttonLvl1: UIButton!
    @IBOutlet weak var buttonLvl2: UIButton!
    @IBOutlet weak var buttonLvl3: UIButton!
    @IBOutlet weak var cookLaterButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
