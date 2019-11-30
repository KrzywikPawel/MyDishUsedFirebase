//
//  ViewController.swift
//  MyDish
//
//  Created by Pawel Krzywik on 30/11/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    override func viewDidLoad() {
//        do{
//        let url = Bundle.main.url(forResource: "lista", withExtension: "json")!
//            let data = try Data(contentsOf: url)
//            let parseData = try JSONDecoder().decode([Dish].self, from: data)
//            print(parseData[0])
//        }catch{
//            print(error)
//        }
        let data = TakeDataToMainView()
        let array = data.parseData()
        print(array[1])
    }
}

