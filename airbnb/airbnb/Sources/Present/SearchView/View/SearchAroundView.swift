//
//  SearchAroundView.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/24.
//

import RxDataSources
import RxRelay
import RxSwift
import UIKit

final class SearchAroundView: UIView {
    enum Contants {
        static let collectionViewInset = 16.0
        static let cellSize = CGSize(width: UIScreen.main.bounds.width - collectionViewInset * 2, height: 64)
        static let headerSize = CGSize(width: UIScreen.main.bounds.width - collectionViewInset * 2, height: 64)
    }
    
    private let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 16
        flowLayout.itemSize = Contants.cellSize
        flowLayout.headerReferenceSize = Contants.headerSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(AroundTravelViewCell.self, forCellWithReuseIdentifier: AroundTravelViewCell.identifier)
        collectionView.register(SearchCollectoinHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SearchCollectoinHeaderView.identifier)
        return collectionView
    }()
    
    private typealias ConfigureCell = (CollectionViewSectionedDataSource<SectionModel<String, AroundTraval>>, UICollectionView, IndexPath, AroundTraval) -> UICollectionViewCell
    private typealias ConfigureSupplementaryView = (CollectionViewSectionedDataSource<SectionModel<String, AroundTraval>>, UICollectionView, String, IndexPath) -> UICollectionReusableView
    
    private let disposeBag = DisposeBag()
    
    let updateDataSource = PublishRelay<[AroundTraval]>()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bind()
        attribute()
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        let configureCell: ConfigureCell = { _, collectionView, indexPath, model -> UICollectionViewCell in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AroundTravelViewCell.identifier, for: indexPath) as? AroundTravelViewCell else {
                return UICollectionViewCell()
            }
            cell.setTraval(model)
            return cell
        }
    
        let configureSupplementaryView: ConfigureSupplementaryView = { _, collectionView, kind, indexPath -> UICollectionReusableView in
            if kind == UICollectionView.elementKindSectionHeader {
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SearchCollectoinHeaderView.identifier, for: indexPath) as? SearchCollectoinHeaderView else {
                    return UICollectionReusableView()
                }
                header.setTitle("근처의 인기 여행지")
                return header
            }
            return UICollectionReusableView()
        }
        
        let dataSource = RxCollectionViewSectionedReloadDataSource<SectionModel<String, AroundTraval>>(configureCell: configureCell, configureSupplementaryView: configureSupplementaryView)
        
        updateDataSource
            .map { [SectionModel(model: "", items: $0)] }
            .bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    private func attribute() {
    }
    
    private func layout() {
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(Contants.collectionViewInset)
        }
    }
}
