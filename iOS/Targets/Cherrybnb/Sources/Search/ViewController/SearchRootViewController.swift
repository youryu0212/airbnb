//
//  SearchViewController.swift
//  Cherrybnb
//
//  Created by 최예주 on 2022/05/24.
//  Copyright © 2022 Codesquad. All rights reserved.
//

import UIKit

class SearchRootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
    }
    
    private func configureNavBar() {
        navigationController?.navigationBar.isHidden = true
    }

}
