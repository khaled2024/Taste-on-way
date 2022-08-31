//
//  DishListViewController.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 30/08/2022.
//

import UIKit

class DishListViewController: UIViewController {
    
    @IBOutlet weak var dishListTableView: UITableView!
    var category: DishCategory!
    var dishes: [Dish] = [
        Dish(id: "id1", name: "khaled", image: "https://img.delicious.com.au/sMGJMdx_/w759-h506-cfill/del/2016/05/harira-moroccan-lamb-tomato-and-lentil-soup-29860-3.jpg", description: "this is populer dish in africa", calories: 30),
        Dish(id: "id2", name: "hussien", image: "https://img.delicious.com.au/sMGJMdx_/w759-h506-cfill/del/2016/05/harira-moroccan-lamb-tomato-and-lentil-soup-29860-3.jpg", description: "this is populer dish in africa this is populer dish in africa this is populer dish in africa this is populer dish in africa", calories: 40),
        Dish(id: "id3", name: "khalifa", image: "https://img.delicious.com.au/sMGJMdx_/w759-h506-cfill/del/2016/05/harira-moroccan-lamb-tomato-and-lentil-soup-29860-3.jpg", description: " this is populer dish in africa", calories: 12)
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.name
        registerCell()
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
