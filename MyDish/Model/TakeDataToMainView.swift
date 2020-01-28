//
//  TakeDataToMainView.swift
//  MyDish
//
//  Created by Pawel Krzywik on 30/11/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage
class TakeDataToMainView{
    
    var dishes: Array<Dish> = []
    
    func parseData(completion:@escaping ([Dish]) -> ()) {
        let reference = Database.database().reference().child("dishes")
        
        reference.queryOrderedByKey().observeSingleEvent(of: .value) { (snapshot) in
            if let objects = snapshot.children.allObjects as? [DataSnapshot] {
                for item in objects{
                    var dish = Dish(snapshot: item)
                    self.dishes.append(dish)
                }
            }
            completion(self.dishes)
        }
    }
    
    
    
    func takeDishFromId(id: Int,completion:@escaping(Dish) -> ()){
        let reference = Database.database().reference().child("dishes")
        reference.child("id\(id)").observeSingleEvent(of: .value) { (snapshot) in
            let dish = Dish(snapshot: snapshot)
            completion(dish)
        }
    }
}


