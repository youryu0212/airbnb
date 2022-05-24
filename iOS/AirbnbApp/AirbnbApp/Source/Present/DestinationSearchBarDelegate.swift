//
//  DestinationSearchBarDelegate.swift
//  AirbnbApp
//
//  Created by 김상혁 on 2022/05/23.
//

import UIKit

class DestinationSearchBarDelegate: NSObject, UISearchBarDelegate {
    let tapTextField = PublishRelay<Void>()
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.searchTextField.resignFirstResponder()
        tapTextField.accept(())
    }
}
