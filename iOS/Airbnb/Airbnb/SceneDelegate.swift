//
//  SceneDelegate.swift
//  Airbnb
//
//  Created by 이건행 on 2022/05/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let tabBarController = self.window?.rootViewController as? UITabBarController else {
            return
        }
        tabBarController.tabBar.tintColor = .black
        tabBarController.tabBar.barTintColor = .gray
        tabBarController.tabBar.clipsToBounds = true
        
        if let tabBarItems = tabBarController.tabBar.items {
            tabBarItems[0].title = "검색"
            tabBarItems[1].title = "위시리스트"
            tabBarItems[2].title = "내 예약"
            
            tabBarItems[0].image = UIImage(named: "magnifyingglass")
            tabBarItems[1].image = UIImage(named: "heart")
            tabBarItems[2].image = UIImage(named: "person.fill")
            
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

