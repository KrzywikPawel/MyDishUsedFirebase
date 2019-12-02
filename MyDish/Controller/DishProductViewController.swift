//
//  DishProductViewController.swift
//  MyDish
//
//  Created by Pawel Krzywik on 02/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit

class DishProductViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mealLabel: UILabel!
    var name:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        
        
    }
}
