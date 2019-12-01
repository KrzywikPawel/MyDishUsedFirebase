//
//  ViewController.swift
//  MyDish
//
//  Created by Pawel Krzywik on 30/11/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    var arrayDish: [Dish] = {
        let data = TakeDataToMainView()
        var arrayDish = data.parseData()
        return arrayDish
    }()
    
    override func viewDidLoad() {
    
    }
    
}


