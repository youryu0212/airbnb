//
//  MainViewController.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/23.
//

import UIKit

final class MainViewController: UIViewController {
    init(viewModel: MainViewModel) {
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = .red
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
