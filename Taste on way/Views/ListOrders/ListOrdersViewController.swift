//
//  ListOrdersViewController.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 30/08/2022.
//

import UIKit
import ProgressHUD
class ListOrdersViewController: UIViewController {
    
    @IBOutlet weak var listOrdertableView: UITableView!
    var orders : [Order] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        registerCells()
        ProgressHUD.show()
    }
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fetchPlaceOrders { [weak self] result in
            switch result {
            case .success(let orders):
                ProgressHUD.dismiss()
                self?.orders = orders
                self?.listOrdertableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = .black
    }
    func registerCells(){
        listOrdertableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}
extension ListOrdersViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath)as! DishListTableViewCell
        cell.setUp(order: orders[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
}
