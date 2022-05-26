//
//  SearchViewController.swift
//  Airbnb_iOS
//
//  Created by juntaek.oh on 2022/05/24.
//

import UIKit

class SearchViewController: UIViewController {

    let searchBar = SearchBarView()
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
        self.navigationItem.titleView = searchBar

        self.navigationController?.hidesBarsOnSwipe = true
        self.searchBar.delegate = self
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        self.nextVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(nextVC, animated: true)

        return false
    }
}
