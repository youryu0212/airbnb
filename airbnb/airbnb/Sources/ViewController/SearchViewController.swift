//
//  SearchViewController.swift
//  airbnb
//
//  Created by Jihee hwang on 2022/05/25.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {

    private let navigationBarUnderLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .grey4
        return view
    }()

    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
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
//        navigationController?.hidesBarsOnSwipe = true
        navigationItem.searchController = searchController
        navigationItem.titleView = logoImageView
    }
    
    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(HeroImageCell.self, forCellWithReuseIdentifier: HeroImageCell.identifier)
        collectionView.register(BannerViewCell.self, forCellWithReuseIdentifier: BannerViewCell.identifier)
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

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int { 2 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else { return 8 }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroImageCell.identifier, for: indexPath) as? HeroImageCell else { return UICollectionViewCell() }
            
                return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerViewCell.identifier, for: indexPath) as? BannerViewCell else { return UICollectionViewCell() }
            
                return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionHeaderView.identifier, for: indexPath) as? CollectionHeaderView else { return UICollectionReusableView() }
        return headerView
    }
}

//extension SearchViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        <#code#>
//    }
//}
