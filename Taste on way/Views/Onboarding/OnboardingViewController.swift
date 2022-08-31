//
//  OnboardingViewController.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 26/08/2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    //MARK: - vars
    @IBOutlet weak var onboardingPageControl: UIPageControl!
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    var currentPage = 0 {
        didSet{
            onboardingPageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            }else{
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    var slides: [OnboardingSlide] = []
    //MARK: - lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
       
        slides = [
                    OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
                    OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
                    OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
                ]
        onboardingPageControl.numberOfPages = slides.count
        
    }
        
    //MARK: - actions
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if currentPage == slides.count - 1{
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC")as! UINavigationController
            
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            UserDefaults.standard.hasOnboarded = true
            present(controller, animated: true, completion: nil)
            
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: .zero)
            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    
    
}
//MARK: - extiensions
extension OnboardingViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifer, for: indexPath)as? OnboardingCollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.setUp(slide: slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    // to show what we scroll
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        // 0/0 = 0
        // 300/300 = 1
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
    
}
