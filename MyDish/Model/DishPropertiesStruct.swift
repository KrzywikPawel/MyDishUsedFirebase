//
//  DishPropertiesStruct.swift
//  MyDish
//
//  Created by Pawel Krzywik on 09/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
import FirebaseFirestore
struct DishPropertiesStruct{
    let id: Int
    var products:Array<String>
    var quantity: Array<String>
    var steps: Array<String>
    
    init(_ id:Int,_ document: DocumentSnapshot) {
        self.id = id
        self.products = document["products"] as! [String]
        self.quantity = document["quantity"] as! [String]
        self.steps = document["steps"] as! [String]
    }
    
}
