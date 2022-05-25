//
//  LocationViewController.swift
//  airbnb
//
//  Created by Bibi on 2022/05/25.
//

import UIKit

class LocationViewController: UITableViewController {
    
    private var searchText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
    }
    
    private func setUI() {
        self.navigationItem.title = "숙소 찾기"
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
    
    private func setConstraints() {
        
    }
}

extension LocationViewController: UISearchControllerDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
}

extension LocationViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
}
