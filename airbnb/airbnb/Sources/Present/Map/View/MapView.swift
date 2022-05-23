//
//  MapView.swift
//  airbnb
//
//  Created by 김동준 on 2022/05/23.
//

import SnapKit
import MapKit

final class MapView: UIView {
    
    lazy var mkMapView: MKMapView = {
        let mkMapView = MKMapView()
        mkMapView.mapType = .standard
        return mkMapView
    }()
    
    lazy var menuButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let itemSize = CGSize(width: frame.width - 60, height: 120)
        print("itemsize \(itemSize)")
        layout.itemSize = itemSize
        layout.minimumLineSpacing = 15
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.layer.backgroundColor = UIColor.blue.cgColor.copy(alpha: 0.0)
        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(MapCollectionCell.self, forCellWithReuseIdentifier: MapCollectionCell.identifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        addSubview(mkMapView)
        addSubview(menuButton)
        addSubview(collectionView)
        mkMapView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(self)
        }
        mkMapView.backgroundColor = .yellow
    
        menuButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalTo(self).offset(20)
            make.width.height.equalTo(50)
        }
        
        collectionView.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.height.equalTo(150)
            make.width.equalTo(self)
        }
    }
}
