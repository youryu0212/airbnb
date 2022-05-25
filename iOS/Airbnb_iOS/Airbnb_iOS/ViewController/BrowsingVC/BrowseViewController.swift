//
//  BrowseViewController.swift
//  Airbnb_iOS
//
//  Created by juntaek.oh on 2022/05/24.
//

import UIKit

class BrowseViewController: UIViewController {
    
    private var searchBarVC: UISearchController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setNavigationItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setSearchBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.searchController = nil
    }
    
    override func willMove(toParent parent: UIViewController?) {
        guard let searchVC = parent as? SearchViewController else { return }
        
        searchBarVC = searchVC.searchBarVC
    }
}

private extension BrowseViewController {
    
    func setNavigationItem() {
        self.navigationItem.title = "숙소 찾기"
        self.navigationItem.backButtonTitle = "뒤로"
    }
    
    func setSearchBar() {
        guard let searchBarVC = searchBarVC else { return }
        
        self.navigationItem.searchController = searchBarVC
    }
}
