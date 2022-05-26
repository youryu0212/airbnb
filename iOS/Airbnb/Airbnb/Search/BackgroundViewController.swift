//
//  BackgroundViewController.swift
//  Airbnb
//
//  Created by YEONGJIN JANG on 2022/05/26.
//

import UIKit

protocol BackgroundViewControllerProtocol {
    func attribute()
    func layout()
    func bind()
    func setUpNavigationAppearance()
}

class BackgroundViewController: UIViewController, BackgroundViewControllerProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func attribute() {
        view.backgroundColor = .white
    }
    
    func layout() {
    }
    
    func bind() {
        
    }
    
    func setUpNavigationAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .yellow
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
}
