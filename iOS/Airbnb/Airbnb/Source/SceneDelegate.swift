//
//  SceneDelegate.swift
//  Airbnb
//
//  Created by YEONGJIN JANG on 2022/05/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        window?.rootViewController = TabBarViewController()
        window?.makeKeyAndVisible()
    }
}

