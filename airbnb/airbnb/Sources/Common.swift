//
//  Common.swift
//  airbnb
//
//  Created by Jihee hwang on 2022/05/26.
//

import UIKit

class Icon {
    static let searchTabBarIcon = UIImage(systemName: "magnifyingglass")
    static let wishListTabBarIcon = UIImage(systemName: "heart")
    static let myReservationTabBarIcon = UIImage(systemName: "person")
}

class Logo {
    static let logoImage = UIImage(named: "logo")
}

class Image {
    static let placeImage = UIImage(named: "Rectangle 2")
}

class Title {
    static let searchBarPlaceholder = "어디로 여행가세요?"
    static let searchTabBarTitle = "검색"
    static let wishListTabBarTitle = "위시리스트"
    static let myReservationTabBarTitle = "내 예약"
    static let mainBannerTitle = "어디에서나, 여행은\n살아보는거야!"
    
}

class Size {
    static let heroImageCell = CGSize(width: 250, height: 500)
}

class Layout {
    static let HeroImageLayout: NSCollectionLayoutSection = {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.4)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.bottom = 150
        return section
    }()
    
    static let travelDestinationLayout: NSCollectionLayoutSection = {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets.trailing = 20
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(0.6)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)]
        section.contentInsets.top = 10
        section.contentInsets.leading = 20
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }()
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            if sectionNumber == 0 {
                return HeroImageLayout
            } else { return travelDestinationLayout }
        }
    }
}
