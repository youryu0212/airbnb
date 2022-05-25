//
//  DestinationCollecionViewDataSource.swift
//  AirbnbApp
//
//  Created by 김상혁 on 2022/05/23.
//

import UIKit

final class DestinationCollecionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var mockHeader: [String] = []
    var mockImage: [UIImage] = []
    var mockCity: [String] = []
    var mockTheme: [String] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionKind = DestinationCollectionViewSection(rawValue: section) else { return 0 }
        
        switch sectionKind {
        case .image:
            return mockImage.count
        case .nearby:
            return mockCity.count
        case .theme:
            return mockTheme.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionKind = DestinationCollectionViewSection(rawValue: indexPath.section) else { return UICollectionViewCell() }
        
        switch sectionKind {
        case .image:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroImageViewCell.identifier, for: indexPath) as? HeroImageViewCell else {
                return UICollectionViewCell()
            }
            
            let image = mockImage[indexPath.item]
            
            cell.setHeroImageView(image: image)
            return cell
        case .nearby:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NearDestinationViewCell.identifier, for: indexPath) as? NearDestinationViewCell else {
                return UICollectionViewCell()
            }
            
            guard let image = UIImage(named: "mockimage.png") else { return cell }
            
            cell.setCityImageView(image: image)
            cell.setCityTitleLabel(text: mockCity[indexPath.item])
            return cell
        case .theme:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TravelThemeViewCell.identifier, for: indexPath) as? TravelThemeViewCell else {
                return UICollectionViewCell()
            }
            guard let image = UIImage(named: "mockimage.png") else { return cell }
            
            cell.setImageView(image: image)
            cell.setDescriptionLabel(text: mockTheme[indexPath.item])
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return mockHeader.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            
            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: DestinationHeaderView.identifier,
                for: indexPath
            ) as? DestinationHeaderView else { return UICollectionReusableView() }
            
            headerView.setHeaderLabel(text: mockHeader[indexPath.section])
            return headerView
        }
        
        return UICollectionReusableView()
    }
}
