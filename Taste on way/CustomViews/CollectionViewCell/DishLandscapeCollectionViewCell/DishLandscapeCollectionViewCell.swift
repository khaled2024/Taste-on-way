//
//  DishLandscapeCollectionViewCell.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 30/08/2022.
//

import UIKit

class DishLandscapeCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: DishLandscapeCollectionViewCell.self)
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var nameDishLable: UILabel!
    
    func setUp(dish: Dish){
        self.dishImageView.kf.setImage(with: dish.image?.asURL)
        self.nameDishLable.text = dish.name
        self.descriptionLable.text = dish.description
        self.caloriesLable.text = dish.formattedCalories
    }

}
