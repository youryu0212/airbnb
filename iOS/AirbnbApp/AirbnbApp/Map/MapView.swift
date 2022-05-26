//
//  MapView.swift
//  AirbnbApp
//
//  Created by 박진섭 on 2022/05/24.
//

import UIKit
import MapKit
import SnapKit

final class MapView: MKMapView {
    
    lazy var cardCollectionView: UICollectionView = {
        let cellWidth = self.frame.width - 50
        let cellHeight = self.frame.height / 6
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(
            width: cellWidth,
            height: cellHeight)
        
        flowLayout.minimumLineSpacing = 16.0
        flowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCollectionView()
    }
    
    @available(*, unavailable) required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpCollectionView() {
        self.addSubview(cardCollectionView)
        
        cardCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.snp.bottom).inset(32.0)
        }
        
        cardCollectionView.snp.makeConstraints {
            $0.height.equalTo(self.frame.height / 6)
        }
    }
    
}
