//
//  DishListTableViewCell.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 30/08/2022.
//

import UIKit
import Kingfisher
class DishListTableViewCell: UITableViewCell {
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var dishDescriptionLable: UILabel!
    @IBOutlet weak var dishNamelable: UILabel!
    
    static let identifier = String(describing: DishListTableViewCell.self)
    
    func setUp(dish: Dish){
        self.dishDescriptionLable.text = dish.description
        self.dishImage.kf.setImage(with: dish.image?.asURL)
        self.dishNamelable.text = dish.name
    }
    
}
