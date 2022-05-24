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
        case albumBody
    }
    
    private var flowLayout: UICollectionViewLayout {
        // Define Inset
        let inset = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2)
        
        // Title
        let titleSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(28))
        let titleItem = NSCollectionLayoutItem(layoutSize: titleSize)
        
        // 2줄 가로 레이아웃
        let horizontalTwoRowSize = NSCollectionLayoutSize(
            widthDimension: .fractionalHeight(2/3),
            heightDimension: .absolute(60))
        
        let horizontalTwoRowItem = NSCollectionLayoutItem(layoutSize: horizontalTwoRowSize)
        
        let horizontalGroupTwoInARow = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(120)),
            subitems: [horizontalTwoRowItem, horizontalTwoRowItem])
        
        horizontalGroupTwoInARow.contentInsets = inset
        
        // 1줄 가로 레이아웃
        let horizontalOneRowSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(4/5),
            heightDimension: .fractionalWidth(1))
        
        let horizontalOneRowItem = NSCollectionLayoutItem(layoutSize: horizontalOneRowSize)
        
        let horizontalGroupOneInARow = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize.init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(200)),
            subitem: horizontalOneRowItem,
            count: 8)
        
        horizontalGroupOneInARow.contentInsets = inset
        
        let resultLayoutGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)),
            subitems: [titleItem, horizontalGroupTwoInARow, titleItem, horizontalGroupOneInARow]
        )
        
        let section = NSCollectionLayoutSection(group: resultLayoutGroup)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    private var backgroundDataSource: (UICollectionView) -> UICollectionViewDiffableDataSource<Section, SearchFavoriteLocationModel> =
    { collectionView in
        UICollectionViewDiffableDataSource<Section, SearchFavoriteLocationModel>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            var cell: UICollectionViewCell?
            
            if indexPath.item == 0 || indexPath.item == 9 {
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchTitleCollectionViewCell.reuseIdentifier, for: indexPath) as? SearchTitleCollectionViewCell
            } else if indexPath.item < 9 {
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchTwoInARowCollectionViewCell.reuseIdentifier, for: indexPath) as? SearchTwoInARowCollectionViewCell
            } else if indexPath.item < 19 {
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchOneInARowCollectionViewCell.reuseIdentifier, for: indexPath) as? SearchOneInARowCollectionViewCell
            }
            
            (cell as? SearchCellCommonType)?.setData(model: itemIdentifier)
            
            return cell
        }
    }
    
    func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Section, SearchFavoriteLocationModel> {
        var snapshot = NSDiffableDataSourceSnapshot<Section, SearchFavoriteLocationModel>()
        snapshot.appendSections([Section.albumBody])
        
        var items = [SearchFavoriteLocationModel]()
        for i in 0..<14 {
            items.append(SearchFavoriteLocationModel(imageData: Data(), titleLabel: "\(i)", subTitleLabel: "\(i)\(i)"))
        }
        
        snapshot.appendItems(items)
        return snapshot
    }
    
    private var backgroundCollectionViewDataSource: UICollectionViewDiffableDataSource<Section, SearchFavoriteLocationModel>?
    private lazy var backgroundCollectionView: UICollectionView = {
        
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.register(SearchTitleCollectionViewCell.self, forCellWithReuseIdentifier: SearchTitleCollectionViewCell.reuseIdentifier)
        collectionView.register(SearchTwoInARowCollectionViewCell.self, forCellWithReuseIdentifier: SearchTwoInARowCollectionViewCell.reuseIdentifier)
        collectionView.register(SearchOneInARowCollectionViewCell.self, forCellWithReuseIdentifier: SearchOneInARowCollectionViewCell.reuseIdentifier)
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        attribute()
    }
    
    private func attribute() {
        view.backgroundColor = .white
        contentView.backgroundColor = .brown
        setUpSearchController()
    }
    
    private func layout() {
        view.addSubview(backgroundCollectionView)

        //MARK: - SnapKit
        backgroundCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension SearchViewController: UISearchResultsUpdating {
    private func setUpSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "어디로 여행가세요?"
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.automaticallyShowsCancelButton = false
        
        searchController.searchResultsUpdater = self
        
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        //TODO: - delegate 를 이용해서 필드가 활성화되면 1. 백버튼 추가, 2. 타이틀 추가
        if searchController.isActive {
            self.navigationItem.title = "숙소 찾기"
            self.navigationItem.hidesBackButton = false
        }
    }
}

