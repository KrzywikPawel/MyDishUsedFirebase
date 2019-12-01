import UIKit
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("se")
        print(arrayDish.count)
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
        cell.levelLabel.text = arrayDish[indexPath.row].level
        return cell
    }
    
}
