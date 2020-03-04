//
//  ShopListStructInCache.swift
//  MyDish
//
//  Created by Pawel Krzywik on 15/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
struct  ShopListStructInCache {
    static func save (_ value: [ShopListDataStruct]!) {
           UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: "shopList")
       }
    
     func delete( index: Int) {
        var shopList = ShopListStructInCache.getShopList()
        shopList.remove(at: index)
        ShopListStructInCache.save(shopList)
    }
    
    static func getShopList() -> [ShopListDataStruct] {
        var shopList: [ShopListDataStruct] = []
        do {
            let shopListFromMemory = UserDefaults.standard.value(forKey: "shopList") ?? Data()
            shopList = try PropertyListDecoder().decode([ShopListDataStruct].self, from: shopListFromMemory as! Data)
        } catch {
            print("error")
        }
        return shopList
    }
    
    static func clearShopList() {
        UserDefaults.standard.removeObject(forKey: "shopList")        
    }
}

