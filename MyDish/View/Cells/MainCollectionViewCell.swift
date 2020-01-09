//
//  MainCollectionViewCell.swift
//  MyDish
//
//  Created by Pawel Krzywik on 11/12/2019.
//  Copyright © 2019 Pawel Krzywik. All rights reserved.
//

import UIKit

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
    
    func configurateWithItem(_ dishImgName: String,_ name:String,_ time: String,_ lvl:Int){
        dishImage?.image = UIImage(named: dishImgName)
        nameLabel?.text = name
        var array = [buttonLvl1,buttonLvl2,buttonLvl3]
        array = customize.levelCustomization(lvl, array as! [UIButton])
        let min = "\(time) min"
        let attributedTime = customize.upperTime(min)
        timeLabel?.attributedText = attributedTime
    }
}

