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
    var name:String = ""
    var id: Int = 0
    var imgArray: Array<String> = []
    var productsArray: Array<String> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        let properties = takeProperties(id: id)
        imgArray = properties.img
        productsArray = properties.products
    }
}
