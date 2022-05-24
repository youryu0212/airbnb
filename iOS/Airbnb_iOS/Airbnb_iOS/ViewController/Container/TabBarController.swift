//
//  ViewController.swift
//  Airbnb_iOS
//
//  Created by juntaek.oh on 2022/05/24.
//

import UIKit

class TabBarController: UITabBarController {
    
    let searchVC = SearchViewController()
    let wishlistVC = WishlistViewController()
    let reserveVC = ReservationViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTabBar()
    }
}

private extension TabBarController {
    func setTabBar() {
        let navigationVC = UINavigationController(rootViewController: searchVC)
        
        navigationVC.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        wishlistVC.tabBarItem = UITabBarItem(title: "위시리스트", image: UIImage(systemName: "heart"), tag: 1)
        reserveVC.tabBarItem = UITabBarItem(title: "내 예약", image: UIImage(systemName: "person"), tag: 2)
        
        self.viewControllers = [navigationVC, wishlistVC, reserveVC]
    }
}
