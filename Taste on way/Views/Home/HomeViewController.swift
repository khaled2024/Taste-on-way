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
    @IBOutlet weak var populerCollectionView: UICollectionView!
    
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
        DishCategory(id: "1", name: "Africa dishs1", image: "https://thedreamafrica.com/wp-content/uploads/2019/07/Ugali-dish.jpg"),
        DishCategory(id: "2", name: "Africa dishs2", image: "https://thedreamafrica.com/wp-content/uploads/2019/07/Ugali-dish.jpg"),
        DishCategory(id: "3", name: "Africa dishs3", image: "https://thedreamafrica.com/wp-content/uploads/2019/07/Ugali-dish.jpg"),
        DishCategory(id: "4", name: "Africa dishs4", image: "https://thedreamafrica.com/wp-content/uploads/2019/07/Ugali-dish.jpg"),
        DishCategory(id: "5", name: "Africa dishs5", image: "https://thedreamafrica.com/wp-content/uploads/2019/07/Ugali-dish.jpg")
    ]
    var populers: [Dish] = [
        Dish(id: "id1", name: "khaled", image: "https://img.delicious.com.au/sMGJMdx_/w759-h506-cfill/del/2016/05/harira-moroccan-lamb-tomato-and-lentil-soup-29860-3.jpg", description: "this is populer dish in africa", calories: 30),
        Dish(id: "id2", name: "hussien", image: "https://img.delicious.com.au/sMGJMdx_/w759-h506-cfill/del/2016/05/harira-moroccan-lamb-tomato-and-lentil-soup-29860-3.jpg", description: "this is populer dish in africa this is populer dish in africa this is populer dish in africa this is populer dish in africa", calories: 40),
        Dish(id: "id3", name: "khalifa", image: "https://img.delicious.com.au/sMGJMdx_/w759-h506-cfill/del/2016/05/harira-moroccan-lamb-tomato-and-lentil-soup-29860-3.jpg", description: " this is populer dish in africa", calories: 12)
    ]
    var specials: [Dish] = [
        Dish(id: "id1", name: "khaled", image: "https://bunzlcatering.co.uk/wp-content/uploads/2018/12/Vegetable-And-Chickpea-Tagine.jpg", description: "this is populer dish in africa this is populer dish in africa ", calories: 30),
        Dish(id: "id2", name: "hussien", image: "https://bunzlcatering.co.uk/wp-content/uploads/2018/12/Vegetable-And-Chickpea-Tagine.jpg", description: "this is populer dish in africa", calories: 40),
        Dish(id: "id3", name: "khalifa", image: "https://bunzlcatering.co.uk/wp-content/uploads/2018/12/Vegetable-And-Chickpea-Tagine.jpg", description: "this is populer dish in africa", calories: 12)
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
        
        populerCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identfier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identfier)
        
        specialsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
    }
    
    //MARK: - actions
    
    
    
    
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
