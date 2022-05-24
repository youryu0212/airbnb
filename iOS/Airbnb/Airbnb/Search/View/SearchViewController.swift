//
//  SearchViewController.swift
//  Airbnb
//
//  Created by YEONGJIN JANG on 2022/05/23.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    enum Section {
        case mainSearchBody
    }
    
    private var flowLayout: UICollectionViewLayout {
        // Define Inset
        let inset = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2)
        
        // Title
        let titleSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.05))
        let titleItem = NSCollectionLayoutItem(layoutSize: titleSize)
        titleItem.contentInsets = inset
        
        let twoRowSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.2))
        let twoRowItem = NSCollectionLayoutItem(layoutSize: twoRowSize)
        twoRowItem.contentInsets = inset
        
        let oneRowSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.44))
        let oneRowItem = NSCollectionLayoutItem(layoutSize: oneRowSize)
        oneRowItem.contentInsets = inset
        
        let resultLayoutGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)),
            subitems: [
                titleItem,
                twoRowItem,
                titleItem,
                oneRowItem
            ]
        )
        
        let section = NSCollectionLayoutSection(group: resultLayoutGroup)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    private var backgroundDataSource: (UICollectionView) -> UICollectionViewDiffableDataSource<Section, [SearchFavoriteLocationModel]> =
    { collectionView in
        UICollectionViewDiffableDataSource<Section, [SearchFavoriteLocationModel]>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            var cell: UICollectionViewCell?
            
            if indexPath.item == 0 || indexPath.item == 2 {
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchTitleCollectionViewCell.reuseIdentifier, for: indexPath) as? SearchTitleCollectionViewCell
                
                if let model = itemIdentifier.first {
                    (cell as? SearchTitleCollectionViewCell)?.setData(model: model)
                }
                
            } else if indexPath.item == 1 {
                
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: MultipleRowsCollectionViewContainerCell.reuseIdentifier, for: indexPath)
                (cell as? MultipleRowsCollectionViewContainerCell)?
                    .applyAttributes(
                        cellType: SearchTwoInARowCollectionViewCell.self,
                        models: itemIdentifier,
                        width: collectionView.frame.width * 2/3,
                        rowCount: 2)
            } else if indexPath.item == 3 {
                
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: MultipleRowsCollectionViewContainerCell.reuseIdentifier, for: indexPath)
                (cell as? MultipleRowsCollectionViewContainerCell)?
                    .applyAttributes(
                        cellType: SearchOneInARowCollectionViewCell.self,
                        models: itemIdentifier,
                        width: collectionView.frame.width * 4/5,
                        rowCount: 1)
            }
            
            return cell
        }
    }
    
    func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Section, [SearchFavoriteLocationModel]> {
        var snapshot = NSDiffableDataSourceSnapshot<Section, [SearchFavoriteLocationModel]>()
        snapshot.appendSections([Section.mainSearchBody])
        
        var items = [[SearchFavoriteLocationModel]]()
        var oneRowItems = [SearchFavoriteLocationModel]()
        var twoRowItems = [SearchFavoriteLocationModel]()
        
        for i in 0 ..< 18 {
            
            let model = SearchFavoriteLocationModel(imageData: Data(), titleLabel: "\(i)", subTitleLabel: "\(i)\(i)")
            
            if i == 0 || i == 9 {
                items.append([model])
            } else if 1...8 ~= i {
                twoRowItems.append(model)
            } else if i > 9 {
                oneRowItems.append(model)
            }
        }
        
        items.insert(twoRowItems, at: 1)
        items.append(oneRowItems)
        
        snapshot.appendItems(items)
        return snapshot
    }
    
    private var backgroundCollectionViewDataSource: UICollectionViewDiffableDataSource<Section, [SearchFavoriteLocationModel]>?
    private lazy var backgroundCollectionView: UICollectionView = {
        
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.register(SearchTitleCollectionViewCell.self, forCellWithReuseIdentifier: SearchTitleCollectionViewCell.reuseIdentifier)
        collectionView.register(MultipleRowsCollectionViewContainerCell.self, forCellWithReuseIdentifier: MultipleRowsCollectionViewContainerCell.reuseIdentifier)
        
        let snapshot = snapshotForCurrentState()
        backgroundCollectionViewDataSource = backgroundDataSource(collectionView)
        collectionView.dataSource = backgroundCollectionViewDataSource
        backgroundCollectionViewDataSource?.apply(snapshot, animatingDifferences: false)
        
        return collectionView
    }()
  
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "어디로 여행가세요?"
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        attribute()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func attribute() {
        view.backgroundColor = .white
        contentView.backgroundColor = .white
        setUpSearchController()
        navAppearance()
    }
    
    private func layout() {
        view.addSubview(backgroundCollectionView)

        backgroundCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let locationVC = LocationViewController()
        locationVC.navigationItem.title = "숙소 찾기"
        let backButton = UIBarButtonItem(title: "뒤로", style: .plain, target: self, action: nil)
//        let removeButton = UIBarButtonItem(title: "지우기", style: .done, target: nil, action: nil)
//        self.navigationItem.rightBarButtonItem = removeButton
        
        backButton.tintColor = .gray
        self.navigationItem.backBarButtonItem = backButton
        self.navigationController?.navigationBar.backgroundColor = .red
        show(locationVC, sender: self)
    }
    
    private func setUpSearchController() {
        self.navigationItem.titleView = searchBar
        searchBar.delegate = self
    }
}

extension SearchViewController {
    private func navAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .yellow
        
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
}
