//
//  DishListViewController.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 30/08/2022.
//

import UIKit
import ProgressHUD
class DishListViewController: UIViewController {
    
    @IBOutlet weak var dishListTableView: UITableView!
    var category: DishCategory!
    var dishes: [Dish] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.name
        registerCell()
        ProgressHUD.show()
        NetworkService.shared.fetchCategoryDishes(categoryID: category.id ?? "") {[weak self] result in
            switch result {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.dishes = dishes
                self?.dishListTableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .systemRed
    }
    func registerCell(){
        dishListTableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}
extension DishListViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath)as! DishListTableViewCell
        cell.setUp(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
        
    }
}
