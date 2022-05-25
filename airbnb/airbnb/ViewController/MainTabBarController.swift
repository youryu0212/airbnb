import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let searchTabVC = UINavigationController(rootViewController: SearchViewController())
        let searchTabBarItem = UITabBarItem(title: "검색",
                                         image: UIImage(systemName: "magnifyingglass.circle"),
                                         selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
        searchTabVC.tabBarItem = searchTabBarItem
        
//        let wishTabVC = UINavigationController(rootViewController: WishViewController())
        let wishTabVC = LocationTableViewController()
        let wishTabBarItem = UITabBarItem(title: "위시리스트",
                                          image: UIImage(systemName: "heart"),
                                          selectedImage: UIImage(systemName: "heart.fill"))
        wishTabVC.tabBarItem = wishTabBarItem
        
        let userTabVC = UINavigationController(rootViewController: UserViewController())
        let userTabBarItem = UITabBarItem(title: "내 예약",
                                          image: UIImage(systemName: "person"),
                                          selectedImage: UIImage(systemName: "person.fill"))
        userTabVC.tabBarItem = userTabBarItem
        
        
        self.viewControllers = [searchTabVC, wishTabVC, userTabVC]
        self.tabBar.backgroundColor = .systemGray6
    }
    
}
