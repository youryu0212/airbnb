//
//  SceneDelegate.swift
//  Airbnb
//
//  Created by Kai Kim on 2022/05/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)

        let homeViewController =  UINavigationController(rootViewController: HomeViewController())
        let wishListViewController = UIViewController()
        wishListViewController.view.backgroundColor = .primary
        let reservationViewController = UIViewController()
        reservationViewController.view.backgroundColor = .orange

        let tabVC =  UITabBarController()
        tabVC.setViewControllers([homeViewController, wishListViewController, reservationViewController], animated: false)

        homeViewController.tabBarItem = UITabBarItem(title: "검색", image: UIImage(named: "search"), tag: 0)
        wishListViewController.tabBarItem = UITabBarItem(title: "위시리스트", image: UIImage(named: "like"), tag: 1)
        reservationViewController.tabBarItem = UITabBarItem(title: "내 예약", image: UIImage(named: "profile"), tag: 2)

        tabVC.tabBar.backgroundColor = .gray6
        tabVC.tabBar.tintColor = .gray1

        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: tabVC.tabBar.frame.size.width, height: 1))
        lineView.backgroundColor = .gray4
        tabVC.tabBar.addSubview(lineView)

        window.rootViewController = tabVC
        window.makeKeyAndVisible()
        self.window = window

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

}
