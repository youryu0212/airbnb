//
//  BrowseViewController.swift
//  Airbnb_iOS
//
//  Created by juntaek.oh on 2022/05/24.
//

import UIKit

class BrowseViewController: UIViewController {
    
    private let dataSource = FamousSpotCollectionLayout()
    private lazy var browseView = FamousSpotCollectionView(frame: view.frame)
    
    private var searchBarVC: UISearchController = {
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationController?.hidesBarsOnSwipe = false
        self.view.addSubview(browseView)
        self.browseView.setDataSource(dataSource)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.searchBarVC.isActive = true
    }
}

extension BrowseViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
}

extension BrowseViewController: UISearchControllerDelegate {
    func didPresentSearchController(_ searchController: UISearchController) {
        DispatchQueue.main.async {
            self.searchBarVC.searchBar.becomeFirstResponder()
        }
    }
}

private extension BrowseViewController {
    
    func setNavigationItem() {
        self.navigationItem.title = "숙소 찾기"
        self.navigationItem.backButtonTitle = "뒤로"
    }
    
    func setSearchBar() {
        self.searchBarVC.delegate = self
        self.navigationItem.searchController = searchBarVC
    }
}
