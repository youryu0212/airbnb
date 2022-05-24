//
//  ViewController.swift
//  Airbnb
//
//  Created by Kai Kim on 2022/05/24.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDisplay()

    }

    private func configureDisplay() {
        self.view.backgroundColor = .gray6
        let navigationBar = navigationController?.navigationBar
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBar?.backgroundColor = .gray6
        navigationBarAppearance.shadowColor = .black
        navigationBar?.scrollEdgeAppearance = navigationBarAppearance
    }

}
