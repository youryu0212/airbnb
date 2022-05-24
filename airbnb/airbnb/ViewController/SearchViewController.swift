import UIKit

class SearchViewController: UIViewController {

    private var searchBar: UISearchBar = {
        var searchBar = UISearchBar()
        searchBar.placeholder = "어디로 여행가세요?"
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.navigationController?.navigationBar.delegate = self
        
        setUI()
        setConstraints()
    }
    
    private func setUI() {
        self.view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.backgroundColor = .systemGray6
        self.navigationItem.titleView = searchBar
    }
    
    private func setConstraints() {
        
        configureSearchBarConstraint()
    }
    
    private func configureSearchBarConstraint() {
        
    }
}

//extension SearchViewController: UINavigationBarDelegate {
//    func position(for bar: UIBarPositioning) -> UIBarPosition {
//        return .topAttached
//    }
//}
