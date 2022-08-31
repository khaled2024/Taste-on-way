//
//  DishDetailViewController.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 30/08/2022.
//

import UIKit
import Kingfisher
import ProgressHUD
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
        navigationController?.navigationBar.tintColor = .systemRed
    }
    func setUp(){
        dishDescriptionLable.text = dish.description
        dishCaloriesLable.text = dish.formattedCalories
        dishNameLable.text = dish.name
        dishDetailImageView.kf.setImage(with: dish.image?.asURL)
    }
    
    @IBAction func placeOrderTapped(_ sender: UIButton) {
        guard let name = nameTextField.text?.trimmingCharacters(in: .whitespaces) , !name.isEmpty else{
            ProgressHUD.showError("Please enter your name")
            return
        }
        ProgressHUD.show("placing order...")
        NetworkService.shared.placeOrder(dishID: dish.id ?? "", name: name) { result in
            switch result{
            case .success(_):
                ProgressHUD.showSuccess("your order has been received👨‍🍳", image: .checkmark, interaction: true)
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    
    
}
