//
//  HomeTravelView.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/23.
//

import RxRelay
import RxSwift
import UIKit

final class RecommandTravelView: UIView {
    enum Constants {
        static let cellSize = CGSize(width: 253, height: 368)
    }
    
    private let contentView = UIView()
    
    private let title: UILabel = {
        let label = UILabel()
        label.text = "어디에서나, 여행은\n살아보는거야!"
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = Constants.cellSize
        flowLayout.minimumLineSpacing = 16
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(RecommandTravelViewCell.self, forCellWithReuseIdentifier: RecommandTravelViewCell.identifier)
        return collectionView
    }()
    
    let updateCell = PublishRelay<[RecommandTraval]>()
    
    private let disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        bind()
        attribute()
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        updateCell
            .bind(to: collectionView.rx.items(cellIdentifier: RecommandTravelViewCell.identifier, cellType: RecommandTravelViewCell.self)) { _, model, cell in
                cell.setTraval(model)
            }
            .disposed(by: disposeBag)
    }
    
    private func attribute() {
    }
    
    private func layout() {
        addSubview(contentView)
        contentView.addSubview(title)
        contentView.addSubview(collectionView)
        
        snp.makeConstraints {
            $0.bottom.equalTo(contentView)
        }
        
        contentView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(collectionView)
        }
        
        title.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(Constants.cellSize.height)
        }
    }
}
