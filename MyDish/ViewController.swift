//
//  ViewController.swift
//  MyDish
//
//  Created by Pawel Krzywik on 30/11/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit

struct Dish:Decodable{
    let name: String
    let time: Int
    let level: Int
}


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        NetworkManager.downloadPlayerProfile{ jsonData in
            guard let jData = jsonData else { return }
            
            do{
                if let json = try JSONSerialization.jsonObject(with: jData, options: []) as? [String: Any]{
                    if let name = json["name"] as? String{
                        print(name)

                    }
        }
            }catch let err{
                print("blad")
            }
        }
    }
}

