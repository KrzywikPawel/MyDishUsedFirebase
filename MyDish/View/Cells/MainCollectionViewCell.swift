//
//  MainCollectionViewCell.swift
//  MyDish
//
//  Created by Pawel Krzywik on 11/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit
import FirebaseStorage
protocol BtnAction: class {
    func cookLaterAction(_ sender: UIButton)
    func addToShopListAction(_ sender: UIButton)
}

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var dishImage: UIImageView?
    @IBOutlet weak private var nameLabel: UILabel?
    @IBOutlet weak private var timeLabel: UILabel?
    @IBOutlet weak private var buttonLvl1: UIButton?
    @IBOutlet weak private var buttonLvl2: UIButton?
    @IBOutlet weak private var buttonLvl3: UIButton?
    @IBOutlet weak  var cookLaterButton: UIButton?
    @IBOutlet weak  var addToShopListButton: UIButton?
    
    private let customize = CustomizeMainDescription()
    weak var delegate: BtnAction?
    
    
    func configurateWithItem(_ width: CGFloat,_ dishImg: UIImage,_ name:String,_ time: String,_ lvl:Int,_ id: Int){
        setCellAutoLayout(width)
        setDishImage(dishImg)
        setTimeLbl(time)
        setLvl(lvl)
        setNameLbl(name)
        cookLaterButton?.tag = id
        addToShopListButton?.tag = id
        
    }
    
    private func setCellAutoLayout(_ width: CGFloat){
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    private func setDishImage(_ img: UIImage){
        dishImage?.translatesAutoresizingMaskIntoConstraints = false
        dishImage?.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        dishImage?.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        dishImage?.image = img
    }
    
    private func setNameLbl(_ name: String) {
          nameLabel?.text = name
      }
    
    private func setTimeLbl(_ time: String){
        let min = "\(time) min"
        let attributedTime = customize.upperTime(min)
        timeLabel?.attributedText = attributedTime
    }
    
    private func setLvl(_ lvl: Int) {
        var array = [buttonLvl1,buttonLvl2,buttonLvl3]
        array = customize.levelCustomization(lvl, array as! [UIButton])
    }
    
    @IBAction func cookLaterButton(_ sender: UIButton) {
        delegate?.cookLaterAction(sender)
    }
    
    @IBAction func addToShopListButton(_ sender: UIButton) {
        delegate?.addToShopListAction(sender)
    }
}

