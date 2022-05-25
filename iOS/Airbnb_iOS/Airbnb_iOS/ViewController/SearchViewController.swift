//
//  SearchViewController.swift
//  Airbnb_iOS
//
//  Created by juntaek.oh on 2022/05/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchBar = UISearchBar()
    let nextVC = BrowseViewController()
    private lazy var homeView = HomeView(frame: view.frame)
    private let dataSource = SearchViewCollectionDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setSearchBar()
        view = homeView
        homeView.setDataSource(dataSource)
    }
}

private extension SearchViewController {
    func setSearchBar() {
        self.searchBar.placeholder = "어디로 여행가세요?"
        self.navigationItem.titleView = searchBar
        self.searchBar.delegate = self
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        let navigationVC = UINavigationController(rootViewController: nextVC)
        
        navigationVC.modalPresentationStyle = .fullScreen
        self.navigationController?.present(navigationVC, animated: true)
        
        return false
    }
}
