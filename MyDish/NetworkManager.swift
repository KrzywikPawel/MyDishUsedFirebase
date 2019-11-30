//
//  Dishes.swift
//  MyDish
//
//  Created by Pawel Krzywik on 30/11/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
let mainDishesView = """
  {
    "name": "Jajecznica",
    "time": "10",
    "level": "0"
  }
"""

class NetworkManager{
    static func downloadPlayerProfile(completion: ((_ json: Data?) -> Void)){
        completion(Data(mainDishesView.utf8))
    }
}
    
