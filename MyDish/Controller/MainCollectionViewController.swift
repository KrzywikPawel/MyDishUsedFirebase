import UIKit
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, BtnAction{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayDish.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        cell.delegate = self
        cell.configurateWithItem(arrayDish[indexPath.row].image, arrayDish[indexPath.row].name, arrayDish[indexPath.row].time,arrayDish[indexPath.row].level,arrayDish[indexPath.row].id)
        return cell
    }
    
    func addToShopListAction(_ sender: UIButton){
        TakePropertiesData().takeProperties(id: sender.tag,completion: {(snapshot) in
            let dish = snapshot
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let pushConfirmShopListVC = storyboard.instantiateViewController(identifier: "ConfirmShopListViewController") as! ConfirmShopListViewController
        pushConfirmShopListVC.products = dish.products
        pushConfirmShopListVC.quantityProduct = dish.quantity
        pushConfirmShopListVC.id = dish.id
            pushConfirmShopListVC.name = self.arrayDish[sender.tag-1].name
        self.navigationController?.pushViewController(pushConfirmShopListVC, animated: true)
        })
    }
    
    func cookLaterAction(_ sender: UIButton){
        arrayLaterCookDishes = defaults.array(forKey: "arrayCookLater")  as? [Int] ?? [Int]()
        if arrayLaterCookDishes.contains(sender.tag){
        }else{
            arrayLaterCookDishes.append(sender.tag)
        }
        defaults.set(arrayLaterCookDishes, forKey: "arrayCookLater")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let pushVC = mainStoryboard.instantiateViewController(withIdentifier: "DishProductViewController") as! DetailDishViewController
        pushVC.name = arrayDish[indexPath.row].name
        pushVC.id = arrayDish[indexPath.row].id
        pushVC.imgName = "id\(pushVC.id)"
        pushVC.time = arrayDish[indexPath.row].time
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
}
