//
//  SearchHomeViewController.swift
//  AirbnbApp
//
//  Created by dale on 2022/05/23.
//

import UIKit
import SnapKit

final class SearchHomeViewController: UIViewController {
    
    private let viewModel: SearchHomeViewModel
    
    private lazy var searchBarDelegate = DestinationSearchBarDelegate()
    private lazy var searchBar: DestinationSearchBar = {
        let searchBar = DestinationSearchBar()
        searchBar.delegate = searchBarDelegate
        return searchBar
    }()
    
    private lazy var destinationCollectionViewDataSource = DestinationCollecionViewDataSource()
    private lazy var destinationCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: SectionLayoutFactory.createCompositionalLayout())
        collectionView.register(HeroImageViewCell.self, forCellWithReuseIdentifier: HeroImageViewCell.identifier)
        collectionView.register(NearDestinationViewCell.self, forCellWithReuseIdentifier: NearDestinationViewCell.identifier)
        collectionView.register(TravelThemeViewCell.self, forCellWithReuseIdentifier: TravelThemeViewCell.identifier)
        collectionView.register(DestinationHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: DestinationHeaderView.identifier)
        collectionView.dataSource = self.destinationCollectionViewDataSource
        return collectionView
    }()
    
    init(viewModel: SearchHomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bind()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSearchTextField()
        layoutDestinationCollecionView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func bind() {
        searchBarDelegate.tapTextField
            .bind { [weak self] in
                self?.navigationController?.pushViewController(UIViewController(), animated: true)
            }
        
        viewModel.state.loadedHeader
            .bind(onNext: { [weak self] in
                self?.destinationCollectionViewDataSource.mockHeader = $0
                self?.destinationCollectionView.reloadData()
            })
        
        viewModel.state.loadedImage
            .bind(onNext: { [weak self] in
                self?.destinationCollectionViewDataSource.mockImage.append( UIImage(named: $0) ?? UIImage())
                self?.destinationCollectionView.reloadData()
            })
        
        viewModel.state.loadedCityName
            .bind(onNext: { [weak self] in
                self?.destinationCollectionViewDataSource.mockCity = $0
                self?.destinationCollectionView.reloadData()
            })
        
        viewModel.state.loadedTheme
            .bind(onNext: { [weak self] in
                self?.destinationCollectionViewDataSource.mockTheme = $0
                self?.destinationCollectionView.reloadData()
            })
        
        viewModel.action.loadHeader.accept(())
        viewModel.action.loadImage.accept(())
        viewModel.action.loadCityName.accept(())
        viewModel.action.loadTheme.accept(())
    }
}

// MARK: - View Layout

private extension SearchHomeViewController {
    
    func layoutSearchTextField() {
        view.addSubview(searchBar)
        
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(36)
        }
    }
    
    func layoutDestinationCollecionView() {
        view.addSubview(destinationCollectionView)
        
        destinationCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}
