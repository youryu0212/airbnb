import UIKit

class SearchViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        let searchBar = UISearchBar()

        searchBar.placeholder = "어디로 여행가세요?"
        self.navigationItem.titleView = searchBar
        

    }
}
