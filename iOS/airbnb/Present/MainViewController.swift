//
//  MainViewController.swift
//  airbnb
//
//  Created by 안상희 on 2022/05/24.
//

import UIKit

class MainViewController: UIViewController {
    
    private let heroImageView: UIImageView = {
        guard let image = UIImage(named: "img_hero") else {
            return UIImageView(image: UIImage(named: ""))
        }
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemMint
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray6
        
        setUpSearchController()
        
        addViews()
        setLayout()
    }
    
    private func setUpSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "어디로 여행가세요?"
        searchController.obscuresBackgroundDuringPresentation = false // true이면 검색 중 뒷 배경 모두 흐릿하게 해줌
        
        self.navigationItem.searchController = searchController
    }
    
    private func addViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(heroImageView)
    }
    
    private func setLayout() {
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        heroImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        heroImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        heroImageView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        heroImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
            .isActive = true
        scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            .isActive = true
        scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: heroImageView.bottomAnchor).isActive = true
    }
}
