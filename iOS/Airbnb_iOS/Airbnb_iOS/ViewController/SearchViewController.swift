//
//  SearchViewController.swift
//  Airbnb_iOS
//
//  Created by juntaek.oh on 2022/05/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setSearchBar()
    }
}

private extension SearchViewController {
    func setSearchBar() {
        self.searchBar.placeholder = "어디로 여행가세요?"
        self.navigationItem.titleView = searchBar
    }
}
