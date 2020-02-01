//
//  TakeDataToMainView.swift
//  MyDish
//
//  Created by Pawel Krzywik on 30/11/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
class TakeDataToMainView{
    
    var dishes: Array<Dish> = []
    
    func parseData(completion:@escaping ([Dish]) -> ()) {
        let database = Firestore.firestore()
        _ = database.collection("dishesName").getDocuments { (document, error) in
            if let err = error {
                print("Error getting documents: \(err)")
            } else {
                for single in document!.documents {
                    var dish = Dish(single)
                    self.takeImg(dish.id) { (img) in
                        dish.image = img
                        self.dishes.append(dish)
                        completion(self.dishes)
                    }
                }
            }
        }
    }
    
    
    
    func takeDishFromId(id: Int,completion:@escaping(Dish) -> ()){
        let database = Firestore.firestore()
        let docRef = database.collection("dishesName").document("id\(id)")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                var dish = Dish(document)
                self.takeImg(id) { (snapshot) in
                    dish.image = snapshot
                    completion(dish)
                }
            } else {
                print("Document does not exist")
            }
        }
    }
    
    func takeImg(_ id: Int, completion:@escaping (UIImage) ->()){
        let storage = Storage.storage().reference(withPath: "dishes/id\(id).jpg")
        var myImage = UIImage()
        storage.getData(maxSize: 1 * 1024 * 1024) { (data, error) -> Void in
            if (error != nil) {
                print("error in takeIMG in takeDataToMainView")
            } else {
                myImage = UIImage(data: data!)!
            }
            completion(myImage)
        }
    }
}


