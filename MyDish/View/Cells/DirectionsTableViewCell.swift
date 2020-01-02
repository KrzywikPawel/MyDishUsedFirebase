//
//  DirectionsTableViewCell.swift
//  MyDish
//
//  Created by Pawel Krzywik on 02/01/2020.
//  Copyright © 2020 Pawel Krzywik. All rights reserved.
//

import UIKit

class DirectionsTableViewCell: UITableViewCell {

    @IBOutlet weak var nrStepsLbl: UILabel!
    @IBOutlet weak var directionLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
