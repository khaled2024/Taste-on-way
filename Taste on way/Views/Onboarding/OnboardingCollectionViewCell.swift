//
//  OnboardingCollectionViewCell.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 26/08/2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleSlideLable: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var descriptionSlideLable: UILabel!
    
    static let identifer = String(describing: OnboardingCollectionViewCell.self)
    
    func setUp(slide: OnboardingSlide){
        self.titleSlideLable.text = slide.title
        self.descriptionSlideLable.text = slide.description
        self.slideImageView.image = slide.image
    }
    
}
