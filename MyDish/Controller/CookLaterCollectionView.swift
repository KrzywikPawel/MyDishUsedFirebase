//
//  CookLaterCollectionView.swift
//  MyDish
//
//  Created by Pawel Krzywik on 09/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
import UIKit
extension CookLaterViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if dishesInArray.count == 0{
            collectionView.setEmptyMessage("Pusto \nKliknij ikone zegara w daniu \ni wroc kiedy zapragniesz")
        }else{
            collectionView.restore()
        }
        
        return dishesInArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        dish = TakeDataToMainView().takeDishFromId(id: dishesInArray[indexPath.row])
        cell.cookLaterButton?.setImage(UIImage(named: "delete"), for: .normal)
        cell.configurateWithItem(dish.image, dish.name, dish.time, dish.level)
//        cell.cookLaterButton.tag = dish.id
//        cell.cookLaterButton.addTarget(self, action: #selector(self.deleteDishFromList(sender:)), for: .touchUpInside)
//        cell.addToShopListButton.tag = dish.id
//        cell.addToShopListButton.addTarget(self, action: #selector(self.addToShopList(sender:)), for: .touchUpInside)
        return cell
    }
    
    @objc func addToShopList(sender: UIButton){
        let shopList = ShopListDataStruct()
        let dish = TakePropertiesData().takeProperties(id: sender.tag)
        shopList.id = dish.id
        let dishStruct = TakeDataToMainView().takeDishFromId(id: shopList.id)
        shopList.name = dishStruct.name
        shopList.products = dish.products
        var array = ShopListStructInCache.get()
        let id = dish.id
        if array.contains(where: {$0.id == id}){
            //            trying add product list which already is added
        }else{
            array.append(shopList)
            ShopListStructInCache.save(array)
        }
        
    }
    
    @objc private func deleteDishFromList(sender:UIButton){
        let id = sender.tag
        for (index,value) in dishesInArray.enumerated(){
            if(value == id){
                dishesInArray.remove(at: index)
                break;
            }
        }
        var array = defaults.array(forKey: "arrayCookLater") as? [Int] ?? [Int]()
        for (index,value) in array.enumerated(){
            if(value == id){
                array.remove(at: index)
                break
            }
        }
        defaults.set(array, forKey: "arrayCookLater")
        cookLaterCollectionview.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let push = mainStoryboard.instantiateViewController(withIdentifier: "DishProductViewController") as! DishProductViewController
        dish = TakeDataToMainView().takeDishFromId(id: dishesInArray[indexPath.row])
        push.name = dish.name
        push.id = dish.id
        self.navigationController?.pushViewController(push, animated: true)
    }
}

fileprivate extension UICollectionView {

    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
//        change font
        messageLabel.font = UIFont(name: "Avenir-Light", size: 18)
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel;
    }

    func restore() {
        self.backgroundView = nil
    }
}
