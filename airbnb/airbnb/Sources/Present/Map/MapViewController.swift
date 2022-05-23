//
//  MapViewController.swift
//  airbnb
//
//  Created by 김동준 on 2022/05/23.
//

import RxAppState
import RxSwift

final class MapViewController: UIViewController {
    
    private lazy var mapView = MapView(frame: view.frame)
    private let mapCollectionDataSource = MapCollectionDataSource()
    private var abc = MapCollectionDelegate()
    private let viewModel: MapViewModelProtocol
    private let disposeBag = DisposeBag()
    
    init(viewModel: MapViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bind()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
        rx.viewState
            .bind(to: viewModel.action().viewLifeChanged)
            .disposed(by: disposeBag)

        viewModel.state().viewLifeCycle
            .filter { $0 == .viewDidLoad }
            .bind { [weak self] _ in
                self?.setupUI()
            }
    }
}
extension MapViewController {
    private func setupUI() {
        view = mapView
        mapView.collectionView.dataSource = mapCollectionDataSource
        mapView.collectionView.delegate = abc
    }
}
