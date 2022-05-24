//
//  WishListViewController.swift
//  Airbnb
//
//  Created by YEONGJIN JANG on 2022/05/23.
//

import UIKit
import SnapKit

class WishListViewController: UIViewController {

    private let testLabel: UILabel = {
        let label = UILabel()
        label.text = "Wish View"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        attribute()
    }
    
    private func attribute() {
        view.backgroundColor = .white
    }
    
    private func layout() {
        view.addSubview(testLabel)
        
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        testLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}
