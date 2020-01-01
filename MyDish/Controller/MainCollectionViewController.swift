import UIKit
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayDish.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        cell.dishImage.image = UIImage(named: "\(arrayDish[indexPath.row].image)")
        cell.nameLabel.text = arrayDish[indexPath.row].name
        let min = "\(arrayDish[indexPath.row].time) min"
        let lvl = arrayDish[indexPath.row].level
        let customizationAttribute = CustomizeMainDescription(arrayDish: arrayDish)
        customizationAttribute.customizeAttributedCell(indexPath,cell,min,lvl)
        cell.cookLaterButton.tag = arrayDish[indexPath.row].id
        cell.cookLaterButton.addTarget(self, action: #selector(self.cookLaterBtn(sender:)),for: .touchUpInside)
        cell.addToShopListButton.tag = arrayDish[indexPath.row].id
        cell.addToShopListButton.addTarget(self, action: #selector(self.addToShopList(sender:)), for: .touchUpInside)
        return cell
    }
    
    @objc private func addToShopList(sender: UIButton){
        let shopList = ShopListDataStruct()
        let dish = TakePropertiesData().takeProperties(id: sender.tag)
        shopList.id = dish.id
        shopList.name = arrayDish[sender.tag-1].name
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
    
    @objc private func cookLaterBtn(sender:UIButton){
        arrayLaterCookDishes = defaults.array(forKey: "arrayCookLater")  as? [Int] ?? [Int]()
        if arrayLaterCookDishes.contains(sender.tag){
        }else{
            arrayLaterCookDishes.append(sender.tag)
        }
        defaults.set(arrayLaterCookDishes, forKey: "arrayCookLater")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let pushVC = mainStoryboard.instantiateViewController(withIdentifier: "DishProductViewController") as! DishProductViewController
        pushVC.name = arrayDish[indexPath.row].name
        pushVC.id = arrayDish[indexPath.row].id
        pushVC.imgName = arrayDish[indexPath.row].image
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
}
