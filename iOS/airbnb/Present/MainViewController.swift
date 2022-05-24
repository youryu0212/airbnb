//
//  MainViewController.swift
//  airbnb
//
//  Created by 안상희 on 2022/05/24.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray6
        
        setUpSearchController()
    }
    
    private func setUpSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "어디로 여행가세요?"
        searchController.obscuresBackgroundDuringPresentation = false // true이면 검색 중 뒷 배경 모두 흐릿하게 해줌
        
        self.navigationItem.searchController = searchController
    }
}
