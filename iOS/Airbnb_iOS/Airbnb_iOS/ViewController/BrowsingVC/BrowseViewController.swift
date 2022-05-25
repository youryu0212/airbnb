//
//  BrowseViewController.swift
//  Airbnb_iOS
//
//  Created by juntaek.oh on 2022/05/24.
//

import UIKit

class BrowseViewController: UIViewController {
    
    private let dataSource = BrowseViewCollectionDataSource()
    private lazy var browseView = BrowseCollectionView(frame: view.frame)
    
    let searchBarVC: UISearchController = {
        let searcher = UISearchController(searchResultsController: nil)
        searcher.searchBar.showsCancelButton = false
        searcher.hidesNavigationBarDuringPresentation = false
        searcher.searchBar.placeholder = "어디로 여행가세요?"
        return searcher
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationItem()
        self.setSearchBar()
        self.view = browseView
        self.browseView.setDataSource(dataSource)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationController?.hidesBarsOnSwipe = false
    }
}

private extension BrowseViewController {
    
    func setNavigationItem() {
        self.navigationItem.title = "숙소 찾기"
        self.navigationItem.backButtonTitle = "뒤로"
    }
    
    func setSearchBar() {
        self.navigationItem.searchController = searchBarVC
    }
}
