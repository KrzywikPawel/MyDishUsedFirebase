//
//  ViewController.swift
//  MyDish
//
//  Created by Pawel Krzywik on 30/11/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainDishCollection: UICollectionView!
    var arrayDish =  [Dish]()
    
    var defaults = UserDefaults.standard
    var arrayLaterCookDishes:[Int] = []
    
    override func viewDidLoad() {
        takeCategoriesToMainCollection()
        arrayLaterCookDishes = defaults.array(forKey: "arrayCookLater") as? [Int] ?? [Int]()
        let nibCell = UINib(nibName: "MainCollectionViewCell", bundle: nil)
        mainDishCollection.register(nibCell, forCellWithReuseIdentifier: "MainCollectionViewCell")
    }
    
    func takeCategoriesToMainCollection() {
        TakeDataToMainView().parseData { (result) in
            self.arrayDish = result
            self.mainDishCollection.reloadData()
        }
    }
}


