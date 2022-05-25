//
//  SearchViewController.swift
//  Airbnb_iOS
//
//  Created by juntaek.oh on 2022/05/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let nextVC = BrowseViewController()
    private lazy var homeView = HomeView(frame: view.frame)
    private let dataSource = SearchViewCollectionDataSource()
    
    let searchBarVC: UISearchController = {
        let searcher = UISearchController(searchResultsController: nil)
        searcher.searchBar.showsCancelButton = false
        searcher.hidesNavigationBarDuringPresentation = false
        searcher.searchBar.placeholder = "어디로 여행가세요?"
        return searcher
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChild(nextVC)
        self.view = homeView
        self.homeView.setDataSource(dataSource)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setSearchBar()
    }
}

private extension SearchViewController {
    func setSearchBar() {
        searchBarVC.searchBar.delegate = self
        
        self.navigationItem.titleView = searchBarVC.searchBar
        self.navigationController?.hidesBarsOnSwipe = true
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        nextVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(nextVC, animated: true)
        
        self.navigationItem.titleView = nil
        searchBarVC.searchBar.delegate = nil

        return true
    }
}
