//
//  DetailDishView.swift
//  MyDish
//
//  Created by Pawel Krzywik on 10/01/2020.
//  Copyright © 2020 Pawel Krzywik. All rights reserved.
//

import UIKit

class DetailDishView:UIView{
    @IBOutlet private weak var directionTable: UITableView!
    @IBOutlet private weak var ingredientsTable: UITableView!
    @IBOutlet private weak var shopListBtn: UIButton!
    @IBOutlet private weak var nameLbl: UILabel!
    @IBOutlet private weak var cookLaterBtn: UIButton!
    @IBOutlet private weak var ingredientsLbl: UILabel!
    @IBOutlet private weak var directionsLbl: UILabel!
    @IBOutlet private weak var timeLbl: UILabel!
    @IBOutlet private weak var cookingTimeLbl: UILabel!
    @IBOutlet private weak var timeView: UIView!
    @IBOutlet private weak var img: UIImageView!
    
    private let detailVC = DetailDishViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setTimeView()
        setIngredientsLbl()
        setDirectionsLbl()
        deleteExtraEmptyCell()
        setCookingTimeLbl()
    }
//    getters
    func getIngredientsTable() -> UITableView{
          return ingredientsTable
      }
      
      func getShopListBtn() -> UIButton{
          return shopListBtn
      }
      
      func getCookLaterBtn() -> UIButton{
          return cookLaterBtn
      }
      
      func getDirectionsTable() -> UITableView{
          return directionTable
      }
    
//    set view func
    
    private func deleteExtraEmptyCell(){
        ingredientsTable.tableFooterView = UIView()
        directionTable.tableFooterView = UIView()
    }
    
    private func setTimeView(){
        timeView.layer.borderWidth = 1
        timeView.layer.borderColor = UIColor.systemGray.cgColor
        timeView.layer.cornerRadius = 10
    }
    
    func setNameLbl(_ name: String){
        nameLbl.text = name
        nameLbl.font = UIFont.boldSystemFont(ofSize: 19)
    }
    
    private func setIngredientsLbl(){
        ingredientsLbl.text = "Ingredients"
        ingredientsLbl.font = UIFont.boldSystemFont(ofSize: 19)
    }
    
    private func setDirectionsLbl(){
        directionsLbl.text = "Directions"
        directionsLbl.font = UIFont.boldSystemFont(ofSize: 19)
    }
    
    func setTimeLbl(_ time: String){
        let stringTime = "\(time) MIN"
        timeLbl.text = stringTime
        timeLbl.font = UIFont.boldSystemFont(ofSize: 19)
    }
    
    func setCookingTimeLbl(){
        cookingTimeLbl.font = cookingTimeLbl.font.withSize(15)
        cookingTimeLbl.textColor = .systemGray
    }
    
    func setImg(_ imgName: String){
        img.image = UIImage(named: imgName)
    }
    
    func setNavigation(_ navigationController: UINavigationController){
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        //  left swipe gestures to back previous controller (after change leftbarimage gesture  doesnt work without this)
        navigationController.interactivePopGestureRecognizer?.delegate = nil
        
    }
    
    
    
    
    
    
    
}
