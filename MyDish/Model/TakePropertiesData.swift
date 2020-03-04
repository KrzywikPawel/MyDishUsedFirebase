//
//  TakePropertiesData.swift
//  MyDish
//
//  Created by Pawel Krzywik on 09/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
import FirebaseFirestore
class TakePropertiesData {
    
    func takeProperties(id:Int,completion:@escaping (DishPropertiesStruct) -> ()) {
        let database = Firestore.firestore()
        let docRef = database.collection("dishes").document("id\(id)")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dishProperties = DishPropertiesStruct(id,document)
                completion(dishProperties)
            } else {
                print("Document does not exist")
            }
        }
    }
}
