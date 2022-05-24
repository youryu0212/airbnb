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
        mainViewController.title = "검색"
        wishListViewController.title = "위시리스트"
        reservationViewController.title = "내 예약"
        
        setViewControllers([mainViewController, wishListViewController, reservationViewController], animated: true)
    }
}
