//
//  DishPortraitCollectionViewCell.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 30/08/2022.
//

import UIKit

class DishPortraitCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleDishLable: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    
    static let identfier = String(describing: DishPortraitCollectionViewCell.self)
    
    func setUp(dish: Dish){
        titleDishLable.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asURL)
        caloriesLable.text = dish.formattedCalories
        descriptionLable.text = dish.description
    }
    

}
