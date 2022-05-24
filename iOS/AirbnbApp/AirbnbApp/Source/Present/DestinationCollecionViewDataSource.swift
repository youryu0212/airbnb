//
//  DestinationCollecionViewDataSource.swift
//  AirbnbApp
//
//  Created by 김상혁 on 2022/05/23.
//

import UIKit

class DestinationCollecionViewDataSource: NSObject, UICollectionViewDataSource {
    
    let mockImage = [UIImage(named: "mockimage.png")]
    let mockCity = ["서울", "광주", "부산", "대구"]
    let mockTheme = ["자연생활을 만끽할 수 있는 숙소", "독특한 공간"]
    
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
            guard let image = mockImage[indexPath.item] else { return cell }
            
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
        return 3
    }
}
