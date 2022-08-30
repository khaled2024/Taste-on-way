//
//  CategoryCollectionViewCell.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 30/08/2022.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryTitleLable: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    func setUp(category: DishCategory){
        self.categoryImageView.kf.setImage(with: URL(string: category.image))
        //or self.categoryImageView.kf.setImage(with: category.image.asURL)
        self.categoryTitleLable.text = category.name
    }

}
