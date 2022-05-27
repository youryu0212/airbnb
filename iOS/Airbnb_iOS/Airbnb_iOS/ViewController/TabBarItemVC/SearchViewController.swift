//
//  SearchViewController.swift
//  Airbnb_iOS
//
//  Created by juntaek.oh on 2022/05/24.
//

import UIKit

class SearchViewController: UIViewController {

    private let browseViewController = BrowseViewController()
    private lazy var homeView = HomeView(frame: view.frame)
    private let dataSource = SearchViewCollectionDataSource()

    let searchBar: UISearchBar = {
        let searcher = UISearchBar()
        searcher.placeholder = "어디로 여행가세요?"
        return searcher
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChild(browseViewController)
        self.setSearchBar()
        self.view = homeView
        self.homeView.setDataSource(dataSource)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = true
    }
}

private extension SearchViewController {
    func setSearchBar() {
        searchBar.delegate = self
        self.navigationItem.titleView = searchBar
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        browseViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(browseViewController, animated: true)

        return false
    }
}
