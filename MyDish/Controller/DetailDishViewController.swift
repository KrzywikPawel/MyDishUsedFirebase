//
//  DishProductViewController.swift
//  MyDish
//
//  Created by Pawel Krzywik on 02/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit
//MARK: refactor this view? (use container view)
class DetailDishViewController: UIViewController {
    @IBOutlet var setView: DetailDishView!
    
    var time: String = ""
    var name:String = ""
    lazy var imgDish = UIImage()
    var id: Int = 0
    
    var directions = [String]()
    var productsArray = [String]()
    var quantityProducts = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        takeDetailInformationAboutDish()
        viewSet()
        leftBarBtnItem()   
    }
    
    private func viewSet() {
        setView.setNavigation(self.navigationController!)
        setView.setNameLbl(name)
        setView.setTimeLbl(time)
        setView.setDishImg(imgDish)
        setView.getCookLaterBtn().addTarget(self, action: #selector(cookLater), for: .touchUpInside)
        setView.getShopListBtn().addTarget(self, action: #selector(addToShopList), for: .touchUpInside)
    }
    
    private func takeDetailInformationAboutDish() {
        TakePropertiesData().takeProperties(id: id, completion: {(snapshot) in
            self.productsArray = snapshot.products
            self.quantityProducts = snapshot.quantity
            self.directions = snapshot.steps
            self.setView.getIngredientsTable().reloadData()
            self.setView.getDirectionsTable().reloadData()
        })
    }
    
    //     refactor to view?
    private func leftBarBtnItem() {
        let backbtn = UIButton(type: .custom)
        backbtn.setImage(UIImage(named: "back"), for: .normal)
        backbtn.addTarget(self, action: #selector(backToMainCollection(sender:)), for: .touchUpInside)
        backbtn.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        let leftItem = UIBarButtonItem(customView: backbtn)
        navigationItem.leftBarButtonItem = leftItem
    }
    
    @objc private func backToMainCollection(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func cookLater() {
        let key = "arrayCookLater"
        let operationInMemory = UserDefaults.standard
        var arrayLaterCookDishes = operationInMemory.array(forKey: key)  as? [Int] ?? [Int]()
        if arrayLaterCookDishes.contains(id){
        }else{
            arrayLaterCookDishes.append(id)
        }
        operationInMemory.set(arrayLaterCookDishes, forKey: key)
    }
    
    @objc private func addToShopList() {
        TakePropertiesData().takeProperties(id: id,completion: {(snapshot) in
            let dishProperties = snapshot
            var dish = Dish()
            TakeDataToMainView().takeDishFromId(id: dishProperties.id, completion: {(result) in
                dish = result
                self.pushConfirmShopListView(dishProperties,dish)
            })
        })
    }
    
    private func pushConfirmShopListView(_ dishProperties:DishPropertiesStruct,_ dish:Dish) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let pushConfirmShopListVC = storyboard.instantiateViewController(identifier: "ConfirmShopListViewController") as! ConfirmShopListViewController
        pushConfirmShopListVC.products = dishProperties.products
        pushConfirmShopListVC.quantityProduct = dishProperties.quantity
        pushConfirmShopListVC.id = dishProperties.id
        pushConfirmShopListVC.name = dish.name
        self.navigationController?.pushViewController(pushConfirmShopListVC, animated: true)
    }
}
