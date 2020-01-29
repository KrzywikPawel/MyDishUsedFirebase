//
//  TakePropertiesData.swift
//  MyDish
//
//  Created by Pawel Krzywik on 09/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
import FirebaseDatabase
class TakePropertiesData {
    
    
    //    private func parseData() -> Array<DishPropertiesStruct>{
    //        var arrayProperties: Array<DishPropertiesStruct> = []
    //        do{
    //            let url = Bundle.main.url(forResource: "PropertiesDish", withExtension: "json")
    //            let data = try Data(contentsOf: url!)
    //            arrayProperties = try JSONDecoder().decode([DishPropertiesStruct].self, from: data)
    //        }catch{
    //            print("error parse properties data")
    //        }
    //        return arrayProperties
    //    }
    
    //    func takeProperties(id:Int) -> DishPropertiesStruct{
    //        var properties: DishPropertiesStruct = DishPropertiesStruct(id: 0, products: [],quantity: [], steps: [])
    //        let arrayProperties = parseData()
    //        for item in arrayProperties{
    //            if(item.id == id){
    //                properties = item
    //            }
    //        }
    //        return properties
    //    }
    
    func takeProperties(id:Int,completion:@escaping (DishPropertiesStruct) -> ()){
        let reference = Database.database().reference().child("properties")
        reference.child("id\(id)").observeSingleEvent(of: .value) { (snapshot) in
            let dishProperties = DishPropertiesStruct(id: id, snapshot: snapshot)
            completion(dishProperties)
        }
    }
}
