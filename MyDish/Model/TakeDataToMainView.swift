//
//  TakeDataToMainView.swift
//  MyDish
//
//  Created by Pawel Krzywik on 30/11/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
import FirebaseDatabase
class TakeDataToMainView{
    
    var dishes: Array<Dish> = []
    func parseData(completion:@escaping ([Dish]) -> ()) {
        let reference = Database.database().reference().child("dishes")
        reference.queryOrderedByKey().observeSingleEvent(of: .value) { (snapshot) in
            if let objects = snapshot.children.allObjects as? [DataSnapshot] {
                for item in objects{
                    let dish = Dish(snapshot: item)
                    self.dishes.append(dish)
                }
                completion(self.dishes)
            }
        }
    }
    
    
    
    func takeDishFromId(id: Int) -> Dish {
        var dish: Dish = Dish(id: 0, image: "", name: "", time: "", level: -1)
        //        let dishes: Array<Dish> = parseData()
        //        for item in dishes{
        //            if(item.id == id){
        //                dish = item
        //            }
        //        }
        //        return dish
        return dish
    }
    
}
