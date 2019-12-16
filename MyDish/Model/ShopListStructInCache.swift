//
//  ShopListStructInCache.swift
//  MyDish
//
//  Created by Pawel Krzywik on 15/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
struct  ShopListStructInCache {
    static func save (_ value: [ShopListDataStruct]!){
           print("----------------------zapis")
           UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: "shopList")
       }
    
    static func add(_ value: ShopListDataStruct!){
        print("----------------------zapis")
        UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: "shopList")
    }
    
    static func get() -> [ShopListDataStruct]{
        print("teraz odczyt------------------------------------------")
        var shopList: [ShopListDataStruct] = []
        do{
            let data = UserDefaults.standard.value(forKey: "shopList") ?? Data()
            shopList = try PropertyListDecoder().decode([ShopListDataStruct].self, from: data as! Data)
        }catch{
            print("error")
        }
        return shopList
    }
}

