//
//  ListOrdersViewController.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 30/08/2022.
//

import UIKit

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var listOrdertableView: UITableView!
    var orders : [Order] = [
        Order(name: "khaled hussien", dish: Dish(id: "id1", name: "khaled", image: "https://bunzlcatering.co.uk/wp-content/uploads/2018/12/Vegetable-And-Chickpea-Tagine.jpg", description: "this is populer dish in africa ", calories: 30), id: "id1"),
        Order(name: "khaled hussien", dish: Dish(id: "id1", name: "khaled", image: "https://bunzlcatering.co.uk/wp-content/uploads/2018/12/Vegetable-And-Chickpea-Tagine.jpg", description: "this is populer dish in africa this is populer dish in africa ", calories: 60), id: "id1"),
        Order(name: "khaled hussien", dish: Dish(id: "id1", name: "khaled", image: "https://bunzlcatering.co.uk/wp-content/uploads/2018/12/Vegetable-And-Chickpea-Tagine.jpg", description: "this is populer dish in africa ", calories: 10), id: "id1")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        

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
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 90
//    }
    
    
    
}
