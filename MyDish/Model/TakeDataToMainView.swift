//
//  TakeDataToMainView.swift
//  MyDish
//
//  Created by Pawel Krzywik on 30/11/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
class TakeDataToMainView{
    func parseData() -> Array<Dish> {
        var dishes: Array<Dish> = []
        do{
        let url = Bundle.main.url(forResource: "DishList", withExtension: "json")
        let data = try Data(contentsOf: url!)
        dishes = try JSONDecoder().decode([Dish].self, from: data)
        }catch{
            print("error parse Data")
            print(error)
        }
         return dishes
    }
    
    func takeDishFromId(id: Int) -> Dish {
        var dish: Dish = Dish(id: 0, image: "", name: "", time: "", level: -1)
        let dishes: Array<Dish> = parseData()
        for item in dishes{
            if(item.id == id){
                dish = item
            }
        }
        return dish
    }
    
}
