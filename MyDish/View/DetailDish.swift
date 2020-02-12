//
//  DetailDishView.swift
//  MyDish
//
//  Created by Pawel Krzywik on 10/01/2020.
//  Copyright © 2020 Pawel Krzywik. All rights reserved.
//

import UIKit

class DetailDishView:UIView{
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
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
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.topAnchor , constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 1200).isActive = true
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor , constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 1200).isActive = true

        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: containerView.topAnchor , constant: 0).isActive = true
        topView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        topView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        topView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        topView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 676).isActive = true
//        topView.backgroundColor = .black
        
        super.awakeFromNib()
        setTimeView()
        setIngredientsLbl()
        setDirectionsLbl()
        deleteExtraEmptyCell()
        setCookingTimeLbl()
    }
    
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
    
    func setImg(_ img: UIImage){
        self.img.image = img
        self.img.contentMode = .scaleAspectFill
        self.img.translatesAutoresizingMaskIntoConstraints = false
        self.img.topAnchor.constraint(equalTo: topView.topAnchor, constant: -68).isActive = true
        self.img.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 0).isActive = true
        self.img.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 0).isActive = true
        self.img.heightAnchor.constraint(equalToConstant: 371).isActive = true
    }
    
    func setNavigation(_ navigationController: UINavigationController){
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        //  left swipe gestures to back previous controller (after change leftbarimage gesture  doesnt work without this)
        navigationController.interactivePopGestureRecognizer?.delegate = nil
        
    }
    
    
    
    
    
    
    
}
