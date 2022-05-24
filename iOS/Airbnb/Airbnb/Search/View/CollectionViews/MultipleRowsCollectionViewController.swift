//
//  MultipleRowsCollectionViewController.swift
//  Airbnb
//
//  Created by 백상휘 on 2022/05/24.
//

import UIKit

private let reuseIdentifier = "Cell"

class MultipleRowsCollectionViewController: UICollectionViewController {
    
    enum Section {
        case SearchMainBody
    }
    
    private var rowCountInMultipleCollectionView: Int = 1
    
    private var customCellType: SearchCellCommonType.Type!
    
    private(set) var customLayout: UICollectionViewLayout!
    
    var modelArray = [SearchFavoriteLocationModel]()
    
    private var diffableDataSource: UICollectionViewDiffableDataSource<Section, SearchFavoriteLocationModel>?
    
    convenience init?(cellType: SearchCellCommonType.Type, models: [SearchFavoriteLocationModel], width: CGFloat, rowCount: UInt) {
        
        let contentSizeWidth = ceil(CGFloat(models.count / Int(rowCount)))
        
        let itemRowSize = NSCollectionLayoutSize(
            widthDimension: .absolute(width),
            heightDimension: .fractionalHeight(1.0))
        let horizontalRowLayout = NSCollectionLayoutItem(layoutSize: itemRowSize)
        
        horizontalRowLayout.contentInsets = NSDirectionalEdgeInsets(
            top: 2, leading: 0, bottom: 2, trailing: 0)
                
        let verticalLayoutGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(width),
                heightDimension: .fractionalHeight(1.0)),
            subitem: horizontalRowLayout,
            count: Int(rowCount))
        
        let horizontalLayoutGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize.init(
                widthDimension: .fractionalWidth(contentSizeWidth),
                heightDimension: .fractionalHeight(1.0)),
            subitem: verticalLayoutGroup,
            count: Int(contentSizeWidth))
        
        horizontalLayoutGroup.contentInsets = NSDirectionalEdgeInsets(
            top: 0, leading: 2, bottom: 2, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: horizontalLayoutGroup)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 0
        config.scrollDirection = .horizontal
        
        layout.configuration = config
        
        self.init(collectionViewLayout: layout)
        
        self.customCellType = cellType
        self.customLayout = layout
        self.modelArray = models
        self.rowCountInMultipleCollectionView = Int(rowCount)
        self.applySnapshot()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, SearchFavoriteLocationModel>()
        snapshot.appendSections([Section.SearchMainBody])
        snapshot.appendItems(modelArray)
        
        collectionView!.register(customCellType, forCellWithReuseIdentifier: customCellType.reuseIdentifier)
        
        diffableDataSource = UICollectionViewDiffableDataSource<Section, SearchFavoriteLocationModel>(
            collectionView: collectionView,
            cellProvider: { [weak self] collectionView, indexPath, itemIdentifier in
                
                guard let cellType = self?.customCellType else { return nil }
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath)
                let concreteCell: SearchCellCommonType? = (cell as? SearchCellCommonType)
                concreteCell?.setData(model: itemIdentifier)
                
                return concreteCell
            })
        
        collectionView.dataSource = diffableDataSource
        diffableDataSource?.apply(snapshot,animatingDifferences: true)
    }
}
