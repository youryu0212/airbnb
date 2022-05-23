//
//  TabBarViewController.swift
//  Airbnb
//
//  Created by YEONGJIN JANG on 2022/05/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    private var defaultIndex = 0 {
        didSet {
            self.selectedIndex = defaultIndex
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
    }
    
    private func attribute() {
        self.view.backgroundColor = .white
        self.selectedIndex = defaultIndex
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .systemGray3
        setUpTabBar()
    }
    
    private func layout() {
        
    }
    
    private func setUpTabBar() {
        let searchNavigationController = UINavigationController(rootViewController: SearchViewController())
        searchNavigationController.tabBarItem.title = "검색"
        searchNavigationController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        let wishListNavigationController = UINavigationController(rootViewController: WishListViewController())
        wishListNavigationController.tabBarItem.title = "위시리스트"
        wishListNavigationController.tabBarItem.image = UIImage(systemName: "heart")
        
        let myInfomationNavigationController = UINavigationController(rootViewController: MyInfoViewController())
        myInfomationNavigationController.tabBarItem.title = "내 예약"
        myInfomationNavigationController.tabBarItem.image = UIImage(systemName: "person")
        
        viewControllers = [
            searchNavigationController, wishListNavigationController, myInfomationNavigationController
        ]
    }
}
