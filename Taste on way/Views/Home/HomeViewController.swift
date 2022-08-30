//
//  HomeViewController.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 26/08/2022.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - variables
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    
    var categories: [DishCategory] = [
        DishCategory(id: "1", name: "Africa dishs1", image: "https://thedreamafrica.com/wp-content/uploads/2019/07/Ugali-dish.jpg"),
        DishCategory(id: "2", name: "Africa dishs2", image: "https://thedreamafrica.com/wp-content/uploads/2019/07/Ugali-dish.jpg"),
        DishCategory(id: "3", name: "Africa dishs3", image: "https://thedreamafrica.com/wp-content/uploads/2019/07/Ugali-dish.jpg"),
        DishCategory(id: "4", name: "Africa dishs4", image: "https://thedreamafrica.com/wp-content/uploads/2019/07/Ugali-dish.jpg"),
        DishCategory(id: "5", name: "Africa dishs5", image: "https://thedreamafrica.com/wp-content/uploads/2019/07/Ugali-dish.jpg")
    ]
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Yum Yum"
        registerNibs()
        
    }
    //MARK: - functions
    private func registerNibs(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    
    //MARK: - actions
    

    

}
//MARK: - extensions
extension HomeViewController: UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath)as! CategoryCollectionViewCell
        cell.setUp(category: categories[indexPath.row])
        return cell
    }

    
}
