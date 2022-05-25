//
//  NavigationBarController.swift
//  airbnb
//
//  Created by Jihee hwang on 2022/05/25.
//

import UIKit
import SnapKit

class NavigationBarController: UIViewController {
    
    private let heroImageView = HeroImageView()
    
    private let navigationBarUnderLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .grey4
        return view
    }()
    
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "어디로 여행가세요?"
        return searchController
    }()

    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        let newSize = CGRect(x: 0, y: 0, width: 90, height: 28)
        UIGraphicsBeginImageContext(CGSize(width: 90, height: 28))
        imageView.image?.draw(in: newSize)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
        UIGraphicsEndImageContext()
        imageView.image = newImage
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        layout()
    }
    
    private func configureView() {
        view.backgroundColor = .white
        navigationItem.searchController = searchController
        navigationItem.titleView = logoImageView
    }
    
    private func layout() {
        view.addSubview(navigationBarUnderLineView)
        view.addSubview(heroImageView)
        
        navigationBarUnderLineView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(1)
        }
        
        heroImageView.snp.makeConstraints {
            $0.top.equalTo(navigationBarUnderLineView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(480)
        }
    }
}
