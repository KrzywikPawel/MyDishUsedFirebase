//
//  DetailDishView.swift
//  MyDish
//
//  Created by Pawel Krzywik on 10/01/2020.
//  Copyright © 2020 Pawel Krzywik. All rights reserved.
//

import UIKit

class DetailDishView:UIView{
    @IBOutlet weak var directionTable: UITableView!
    @IBOutlet weak var ingredientsTable: UITableView!
    @IBOutlet weak var shopListBtn: UIButton!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var cookLaterBtn: UIButton!
    @IBOutlet weak var ingredientsLbl: UILabel!
    @IBOutlet weak var directionsLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var cookingTimeLbl: UILabel!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var img: UIImageView!
    let detailVC = DetailDishViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setTimeView()
        //  delete extra empty cell
        //        leftBarBtnItem()
        setIngredientsLbl()
        setDirectionsLbl()
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
