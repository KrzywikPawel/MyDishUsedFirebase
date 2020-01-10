import UIKit
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayDish.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        cell.configurateWithItem(arrayDish[indexPath.row].image, arrayDish[indexPath.row].name, arrayDish[indexPath.row].time,arrayDish[indexPath.row].level)
        cell.cookLaterButton?.tag = arrayDish[indexPath.row].id
        cell.cookLaterButton?.addTarget(self, action: #selector(self.cookLaterBtn(sender:)),for: .touchUpInside)
        cell.addToShopListButton?.tag = arrayDish[indexPath.row].id
        cell.addToShopListButton?.addTarget(self, action: #selector(self.addToShopList(sender:)), for: .touchUpInside)
        return cell
    }
    
    @objc private func addToShopList(sender: UIButton){
        let dish = TakePropertiesData().takeProperties(id: sender.tag)
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let pushConfirmShopListVC = storyboard.instantiateViewController(identifier: "ConfirmShopListViewController") as! ConfirmShopListViewController
        pushConfirmShopListVC.products = dish.products
        pushConfirmShopListVC.quantityProduct = dish.quantity
        pushConfirmShopListVC.id = dish.id
        pushConfirmShopListVC.name = arrayDish[sender.tag-1].name
        self.navigationController?.pushViewController(pushConfirmShopListVC, animated: true)
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
        pushVC.time = arrayDish[indexPath.row].time
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
}
