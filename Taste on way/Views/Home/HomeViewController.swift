//
//  HomeViewController.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 26/08/2022.
//

import UIKit
import ProgressHUD
class HomeViewController: UIViewController {
    
    //MARK: - variables
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var populerCollectionView: UICollectionView!
    
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    var categories: [DishCategory] = []
    var populers: [Dish] = []
    var specials: [Dish] = []
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Yum Yum"
        registerNibs()
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories {[weak self] result in
            switch result{
            case .success(let allDishes):
                print("success")
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.populers = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                self?.categoryCollectionView.reloadData()
                self?.populerCollectionView.reloadData()
                self?.specialsCollectionView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    //MARK: - functions
    private func registerNibs(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        populerCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identfier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identfier)
        
        specialsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
    }
    
    //MARK: - actions
    
    @IBAction func ordersButtonTapped(_ sender: UIBarButtonItem) {
        let controller = ListOrdersViewController.instantiate()
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
//MARK: - extensions
extension HomeViewController: UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case populerCollectionView:
            return populers.count
        case specialsCollectionView:
            return specials.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath)as! CategoryCollectionViewCell
            cell.setUp(category: categories[indexPath.row])
            return cell
        case populerCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identfier, for: indexPath)as! DishPortraitCollectionViewCell
            cell.setUp(dish: populers[indexPath.row])
            return cell
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath)as! DishLandscapeCollectionViewCell
            cell.setUp(dish: specials[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView{
            let conteoller = DishListViewController.instantiate()
            conteoller.category = categories[indexPath.row]
            navigationController?.pushViewController(conteoller, animated: true)
        }else{
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == populerCollectionView ? populers[indexPath.row] : specials[indexPath.row]
            //or
            /*
             if collectionView == populerCollectionView {
             controller.dish = populers[indexPath.row]
             }else{
             controller.dish = specials[indexPath.row]
             }
             */
            navigationController?.pushViewController(controller, animated: true)
            
        }
    }
    
}
