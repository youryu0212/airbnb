//
//  SearchHomeViewController.swift
//  AirbnbApp
//
//  Created by dale on 2022/05/23.
//

import UIKit
import SnapKit

class SearchHomeViewController: UIViewController {
    
    private let textFieldDelegate = TextFieldDelegate()
    
    private let searchTextField = SearchTextField()
    
    private let ideaImageView: UIImageView = {
        let image = UIImage(systemName: "pencil")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .blue
        return imageView
    }()
    
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
        
        layoutSearchTextField()
        layoutIdeaImageVeiw()
        layoutDestinationCollecionView()
        configureDestinationCollecionView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func configureDestinationCollecionView() {
        destinationCollecionView.register(DestinationCollectionViewCell.self, forCellWithReuseIdentifier: DestinationCollectionViewCell.identifier)
        destinationCollecionView.register(DestinationHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DestinationHeaderView.identifier)
        
        destinationCollecionView.dataSource = destinationCollecionViewDataSource
        destinationCollecionView.collectionViewLayout = collectionViewFlowLayout
    }
}

// MARK: - View Layout

private extension SearchHomeViewController {
    
    func layoutSearchTextField() {
        view.addSubview(searchTextField)
        
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(36)
        }
    }
    
    func layoutIdeaImageVeiw() {
        view.addSubview(ideaImageView)
        
        ideaImageView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(488)
        }
    }
    
    func layoutDestinationCollecionView() {
        view.addSubview(destinationCollecionView)
        
        destinationCollecionView.snp.makeConstraints { make in
            make.top.equalTo(ideaImageView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(164)
        }
    }
}
