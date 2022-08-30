//
//  DishDetailViewController.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 30/08/2022.
//

import UIKit
import Kingfisher
class DishDetailViewController: UIViewController {
    
    @IBOutlet weak var placeOrderButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dishDescriptionLable: UILabel!
    @IBOutlet weak var dishCaloriesLable: UILabel!
    @IBOutlet weak var dishNameLable: UILabel!
    @IBOutlet weak var dishDetailImageView: UIImageView!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .white
    }
    func setUp(){
        dishDescriptionLable.text = dish.description
        dishCaloriesLable.text = dish.formattedCalories
        dishNameLable.text = dish.name
        dishDetailImageView.kf.setImage(with: dish.image?.asURL)
    }
    
    @IBAction func placeOrderTapped(_ sender: UIButton) {
    }
    
    
    
}
