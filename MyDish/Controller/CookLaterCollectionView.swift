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
        return dishesInArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        let dish = TakeDataToMainView().takeDishFromId(id: dishesInArray[indexPath.row])
        cell.dishImage.image = UIImage(named: dish.image)
        cell.nameLabel.text = dish.name
        let customizationAttribute = CustomizeMainDescription(dish: dish)
        let min = "\(dish.time) min"
        let lvl = dish.level
        customizationAttribute.customizeAttributedCell(indexPath,cell,min,lvl)
        return cell
    }
}
