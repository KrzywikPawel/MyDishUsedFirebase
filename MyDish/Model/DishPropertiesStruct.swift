//
//  DishPropertiesStruct.swift
//  MyDish
//
//  Created by Pawel Krzywik on 09/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
import FirebaseDatabase
struct DishPropertiesStruct{
    let id: Int
    var products:Array<String>
    var quantity: Array<String>
    var steps: Array<String>
    
    init(id:Int,snapshot: DataSnapshot) {
        let value = snapshot.value as! [String:AnyObject]
        self.id = id
        let productDictionary = value["products"] as! [String:AnyObject]
        let quantityDictionary = value["quantity"] as! [String:AnyObject]
        let stepsDictionary = value["steps"] as! [String:AnyObject]
        self.products = Array(productDictionary.values) as! [String]
        self.quantity = Array(quantityDictionary.values) as! [String]
        self.steps = Array(stepsDictionary.values) as! [String]
    }
    
}
