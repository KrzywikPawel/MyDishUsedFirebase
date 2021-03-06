//
//  CookLaterCollectionView.swift
//  MyDish
//
//  Created by Pawel Krzywik on 09/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import Foundation
import UIKit
extension CookLaterViewController:UICollectionViewDataSource,UICollectionViewDelegate, BtnAction {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if dishesInArray.count == 0{
            let setMessage = SetEmptyTableAndCollectionMessage()
            setMessage.collectionSetEmptyMessage(collectionView,emptyMessage)
        } else {
            //            method in CollectionViewSetEmptyMessage file
            collectionView.restore()
        }
        return dishesInArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        let width = collectionView.contentSize.width
        cell.widthAnchor.constraint(equalToConstant: width).isActive = true
        TakeDataToMainView().takeDishFromId(id: dishesInArray[indexPath.row], completion: {(result) in
            cell.delegate = self
            self.dish = result
            cell.configurateWithItem(width,self.dish.image, self.dish.name, self.dish.time, self.dish.level,self.dish.id)
            cell.cookLaterButton?.setImage(UIImage(named: "delete"), for: .normal)
        })
        return cell
    }
    
    func addToShopListAction(_ sender: UIButton) {
        TakePropertiesData().takeProperties(id: sender.tag,completion: {(snapshot) in
            let dishProperties = snapshot
            var dish = Dish()
            TakeDataToMainView().takeDishFromId(id: dishProperties.id, completion: {(result) in
                dish = result
                self.pushConfirmShopListView(dishProperties,dish)
            })
        })
    }
    
    private func pushConfirmShopListView(_ dish:DishPropertiesStruct,_ dishStruct:Dish) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let pushConfirmShopListVC = storyboard.instantiateViewController(identifier: "ConfirmShopListViewController") as! ConfirmShopListViewController
        pushConfirmShopListVC.products = dish.products
        pushConfirmShopListVC.quantityProduct = dish.quantity
        pushConfirmShopListVC.id = dish.id
        pushConfirmShopListVC.name = dishStruct.name
        self.navigationController?.pushViewController(pushConfirmShopListVC, animated: true)
    }
    //    delete dish from list
    func cookLaterAction(_ sender: UIButton) {
        let id = sender.tag
        for (index,value) in dishesInArray.enumerated(){
            if(value == id) {
                dishesInArray.remove(at: index)
                break;
            }
        }
        var arrayCookLater = defaults.array(forKey: "arrayCookLater") as? [Int] ?? [Int]()
        for (index,value) in arrayCookLater.enumerated(){
            if(value == id){
                arrayCookLater.remove(at: index)
                break
            }
        }
        defaults.set(arrayCookLater, forKey: "arrayCookLater")
        cookLaterCollectionview.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let push = mainStoryboard.instantiateViewController(withIdentifier: "DishProductViewController") as! DetailDishViewController
        TakeDataToMainView().takeDishFromId(id: dishesInArray[indexPath.row], completion: {(result) in
            self.dish = result
            push.name = self.dish.name
            push.id = self.dish.id
            push.time = self.dish.time
            push.imgDish = self.dish.image
            self.navigationController?.pushViewController(push, animated: true)
        })
    }
}


