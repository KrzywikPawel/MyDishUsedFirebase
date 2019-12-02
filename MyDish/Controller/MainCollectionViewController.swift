import UIKit
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayDish.count
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainDishCollectionViewCell
        cell.dishImage.image = UIImage(named: "\(arrayDish[indexPath.row].image)")
        cell.nameLabel.text = arrayDish[indexPath.row].name
        let m = "\(arrayDish[indexPath.row].time) min"
        let attributedString = NSMutableAttributedString(string: m)
        let range = NSRange(location: 3, length: 3)
        attributedString.setAttributes([NSAttributedString.Key.baselineOffset: 8], range: range)
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: range)
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17), range: NSRange(location: 0, length: 2))
        cell.timeLabel.attributedText = attributedString
        let customLvl = CustomizeMainDescription(dish: arrayDish)
        customLvl.levelCustomization(indexPath, cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
           let pushVC = mainStoryboard.instantiateViewController(withIdentifier: "DishProductViewController") as! DishProductViewController
        pushVC.name = arrayDish[indexPath.row].name
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
}
