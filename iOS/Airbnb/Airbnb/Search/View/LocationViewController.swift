//
//  LocationViewController.swift
//  Airbnb
//
//  Created by YEONGJIN JANG on 2022/05/24.
//

import UIKit

class LocationViewController: UIViewController {

    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        let searchBar = searchController.searchBar
        searchBar.placeholder = "어디로 여행가세요?"
        searchBar.searchTextField.clearButtonMode = .never
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.automaticallyShowsCancelButton = false
        return searchController
    }()
        
    
    lazy var removeButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(title: "지우기", style: .done,
                                        target: self, action: #selector(self.clearSearchField(_:)))
        barButton.tintColor = .gray
        return barButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navAppearance()
        setUpSearchController()
    }
    
    private func setUpSearchController() {
        self.navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
}


extension LocationViewController {
    private func navAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .yellow
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
}

extension LocationViewController: UISearchBarDelegate {
    
    @objc func clearSearchField(_ sender: Any) {
        searchController.searchBar.text = nil
        searchController.resignFirstResponder()
        self.navigationItem.rightBarButtonItem = nil
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            self.navigationItem.rightBarButtonItem = removeButton
        } else {
            self.navigationItem.rightBarButtonItem = nil
        }
    }
}
