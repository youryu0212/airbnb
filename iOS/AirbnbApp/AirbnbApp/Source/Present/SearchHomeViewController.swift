//
//  SearchHomeViewController.swift
//  AirbnbApp
//
//  Created by dale on 2022/05/23.
//

import UIKit

class SearchHomeViewController: UIViewController {
    
    private let textFieldDelegate = TextFieldDelegate()
    
    private let searchBarView = SearchBarView()
    
    private let destinationCollecionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private var destinationCollecionViewDataSource = DestinationCollecionViewDataSource()
    
    private var collectionViewFlowLayout: UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 253, height: 74)
        flowLayout.minimumInteritemSpacing = 16
        flowLayout.scrollDirection = .horizontal
        return flowLayout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(searchBarView)
        
        searchBarView.setTextFieldDelegate(by: textFieldDelegate)
        
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        searchBarView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        searchBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        searchBarView.heightAnchor.constraint(equalToConstant: 112).isActive = true
        
        view.addSubview(destinationCollecionView)
        destinationCollecionView.translatesAutoresizingMaskIntoConstraints = false
        destinationCollecionView.topAnchor.constraint(equalTo: searchBarView.bottomAnchor).isActive = true
        destinationCollecionView.heightAnchor.constraint(equalToConstant: 164).isActive = true
        destinationCollecionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        destinationCollecionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        destinationCollecionView.register(DestinationCollectionViewCell.self, forCellWithReuseIdentifier: DestinationCollectionViewCell.identifier)
        destinationCollecionView.register(DestinationHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DestinationHeaderCollectionReusableView.identifier)
        
        destinationCollecionView.dataSource = destinationCollecionViewDataSource
        destinationCollecionView.collectionViewLayout = collectionViewFlowLayout
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
