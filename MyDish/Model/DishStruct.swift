//
//  DishStruct.swift
//  MyDish
//
//  Created by Pawel Krzywik on 30/11/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
import FirebaseDatabase
struct Dish:Decodable{
    let id:Int
    let image: String
    let name: String
    let time: String
    let level: Int
    
    init(snapshot: DataSnapshot) {
        let value = snapshot.value as! [String: AnyObject]
        self.id = value["id"] as! Int
        self.image = ""
        self.level = value["lvl"] as! Int
        self.name = value["name"] as! String
        let timeValue = value["time"] as! Int
        self.time = "\(timeValue)"
    }
    
    init(id: Int, image: String, name: String, time: String, level: Int) {
        self.id = id
        self.image = image
        self.name = name
        self.time = time
        self.level = level
    }
}


