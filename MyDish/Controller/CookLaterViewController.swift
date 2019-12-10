//
//  CookLaterViewController.swift
//  MyDish
//
//  Created by Pawel Krzywik on 09/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit

class CookLaterViewController: UIViewController {
    let vc:ViewController = ViewController()
    var dishesInArray: Array<Int> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        dishesInArray = vc.defaults.array(forKey: "arrayCookLater") as? [Int] ?? [Int]()
        
    }
}
