//
//  SearchHomeViewController.swift
//  AirbnbApp
//
//  Created by dale on 2022/05/23.
//

import UIKit
import SnapKit

class SearchHomeViewController: UIViewController {
    
    private let viewModel: SearchHomeViewModel
    
    private let searchBar = DestinationSearchBar()
    private let searchBarDelegate = DestinationSearchBarDelegate()
    
    private lazy var destinationCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        
        collectionView.register(HeroImageViewCell.self, forCellWithReuseIdentifier: HeroImageViewCell.identifier)
        collectionView.register(NearDestinationViewCell.self, forCellWithReuseIdentifier: NearDestinationViewCell.identifier)
        collectionView.register(TravelThemeViewCell.self, forCellWithReuseIdentifier: TravelThemeViewCell.identifier)
        collectionView.register(DestinationHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DestinationHeaderView.identifier)
        
        collectionView.dataSource = self.destinationCollectionViewDataSource
        
        return collectionView
    }()
    
    private var destinationCollectionViewDataSource = DestinationCollecionViewDataSource()
    
    init(viewModel: SearchHomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
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
        
        searchBar.delegate = searchBarDelegate
        
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, _) -> NSCollectionLayoutSection? in
            guard let sectionKind = DestinationCollectionViewSection(rawValue: sectionNumber) else { return nil }
            let section: NSCollectionLayoutSection
            switch sectionKind {
            case .image:
                section = self.heroImageLayoutSection()
            case .nearby:
                section = self.nearDestinationLayoutSection()
            case .theme:
                section = self.themeLayoutSection()
            }
            return section
        }
    }
    
    func heroImageLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(
            layoutSize: itemSize)
        item.contentInsets.bottom = 15
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1.0)
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item])
        group.contentInsets = .init(
            top: 0,
            leading: 0,
            bottom: 0,
            trailing: 0
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(44)),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .topLeading)
        ]
        
        return section
        
    }
    
    func nearDestinationLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.7),
            heightDimension: .fractionalHeight(0.2)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(
            top: 0,
            leading: 0,
            bottom: 15,
            trailing: 0
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.9),
            heightDimension: .fractionalHeight(0.25)
        )
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 15
        
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(56)),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .topLeading)
        ]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    func themeLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(
            layoutSize: itemSize)
        item.contentInsets.bottom = 15
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.8),
            heightDimension: .fractionalWidth(0.8)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.contentInsets = .init(
            top: 0,
            leading: 0,
            bottom: 15,
            trailing: 16
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets.leading = 15
        
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(56)),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .topLeading)
        ]
        
        return section
    }
}
