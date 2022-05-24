//
//  MainTabBarViewController.swift
//  airbnb
//
//  Created by 안상희 on 2022/05/24.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    let mainViewController = MainViewController()
    let wishListViewController = WishListViewController()
    let reservationViewController = ReservationViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViewControllers()
    }
    
    private func setUpViewControllers() {
        UITabBar.appearance().tintColor = .black
        
        let navigationController = UINavigationController(rootViewController: mainViewController)
        let viewControllers = [navigationController, wishListViewController, reservationViewController]
        setViewControllers(viewControllers, animated: true)
        
        if let tabBarItems = tabBar.items {
            tabBarItems[0].title = "검색"
            tabBarItems[1].title = "위시리스트"
            tabBarItems[2].title = "내 예약"
            
            tabBarItems[0].image = UIImage(named: "magnifyingglass")
            tabBarItems[1].image = UIImage(named: "heart")
            tabBarItems[1].selectedImage = UIImage(named: "heart.fill")
            tabBarItems[2].image = UIImage(named: "person")
            tabBarItems[2].selectedImage = UIImage(named: "person.fill")
        }
    }
}
