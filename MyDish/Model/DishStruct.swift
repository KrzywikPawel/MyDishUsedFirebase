//
//  DishStruct.swift
//  MyDish
//
//  Created by Pawel Krzywik on 30/11/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
import FirebaseFirestore
struct Dish{
    let id:Int
    var image: UIImage
    let name: String
    let time: String
    let level: Int
    
    init(_ document: DocumentSnapshot) {
            self.id = document["id"] as! Int
            self.image = UIImage()
            self.level = document["lvl"] as! Int
            self.name = document["name"] as! String
            self.time = document["time"] as! String
    }
    
    init() {
        self.id = -1
        self.image = UIImage()
        self.name = ""
        self.time = ""
        self.level = -1
    }
}


