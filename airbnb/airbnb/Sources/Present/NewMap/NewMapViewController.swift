//
//  NewMapViewController.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/25.
//

import MapKit
import RxSwift
import UIKit

final class NewMapViewController: UIViewController {
    
    enum Contants {
        static let spacing = 16.0
        static let cellSize = CGSize(width: 320, height: 120)
    }
    
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.mapType = .standard
        mapView.register(PriceAnnotationView.self, forAnnotationViewWithReuseIdentifier: PriceAnnotationView.identifier)
        return mapView
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = Contants.cellSize
        layout.minimumLineSpacing = Contants.spacing
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(MapCollectionCell.self, forCellWithReuseIdentifier: MapCollectionCell.identifier)
        return collectionView
    }()
    
    private let viewModel: NewMapViewModel
    private let disposeBag = DisposeBag()
    
    init(viewModel: NewMapViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bind()
        attribute()
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        rx.viewDidLoad
            .bind(to: viewModel.viewDidLoad)
            .disposed(by: disposeBag)
        
        viewModel.updateRegion
            .map { ($0, true) }
            .bind(onNext: mapView.setRegion)
            .disposed(by: disposeBag)
        
        viewModel.updatePin
            .bind(to: collectionView.rx.items(cellIdentifier: MapCollectionCell.identifier, cellType: MapCollectionCell.self)) { _, _, _ in
            }
            .disposed(by: disposeBag)
        
//        collectionView.rx.itemSelected
    }
    
    private func attribute() {
        
    }
    
    private func layout() {
        view.addSubview(mapView)
        view.addSubview(collectionView)
        
        mapView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(120)
        }
        
        collectionView.frameLayoutGuide.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.width.height.equalTo(300)
        }
    }
}
