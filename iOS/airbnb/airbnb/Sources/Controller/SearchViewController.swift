//
//  SearchViewController.swift
//  airbnb
//
//  Created by Jihee hwang on 2022/05/25.
//

import UIKit
import SnapKit

final class SearchViewController: UIViewController {

    private let dataSource = SearchCollectionViewDataSource()
    private let searchBarDelegate = SearchBarDelegate()
    
    private let navigationBarUnderLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .grey4
        return view
    }()

    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: SearchTableViewController())
        searchController.searchBar.placeholder = Title.searchBarPlaceholder
        searchController.obscuresBackgroundDuringPresentation = true
        return searchController
    }()

    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Logo.logoImage
        let newSize = CGRect(x: 0, y: 0, width: 90, height: 28)
        UIGraphicsBeginImageContext(CGSize(width: 90, height: 28))
        imageView.image?.draw(in: newSize)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
        UIGraphicsEndImageContext()
        imageView.image = newImage
        return imageView
    }()
    
    private let collectionView: UICollectionView = {
        let layout = Layout.createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setCollectionView()
        layout()
    }
    
    private func configureView() {
        view.backgroundColor = .white
        navigationItem.searchController = searchController
        navigationItem.titleView = logoImageView

        searchController.searchBar.delegate = searchBarDelegate
    }
    
    private func setCollectionView() {
        collectionView.dataSource = dataSource
        
        collectionView.register(HeroImageCell.self, forCellWithReuseIdentifier: HeroImageCell.identifier)
        collectionView.register(RecommendedTravelDestinationCell.self, forCellWithReuseIdentifier: RecommendedTravelDestinationCell.identifier)
        collectionView.register(CollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeaderView.identifier)
    }
    
    private func layout() {
        view.addSubview(navigationBarUnderLineView)
        view.addSubview(collectionView)

        navigationBarUnderLineView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(1)
        }

        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
