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

        self.viewControllers = [searchTabVC]

    }
    
}
