//
//  SearchViewCollectionDataSource.swift
//  Airbnb_iOS
//
//  Created by 김한솔 on 2022/05/24.
//

import Foundation
import UIKit

final class SearchViewCollectionDataSource: NSObject, UICollectionViewDataSource {
    
    var items: [MySection] = [
        .first([MySection.FirstItem.init(image: UIImage(named: "heroImage") ?? UIImage())]),
        .second([MySection.SecondItem].init(repeating: MySection.SecondItem.init(image: UIImage(named: "SeoulImage") ?? UIImage(), title: "서울", distance: "차로 30분 거리"), count: 20)),
        .third([MySection.ThirdItem].init(repeating: MySection.ThirdItem.init(image: UIImage(named: "LivingImage") ?? UIImage(), title: "자연생활을 만끽할 수 있는 숙소"), count: 5))
    ]
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch items[section] {
        case let .first(_items):
            return _items.count
        case let .second(_items):
            return _items.count
        case let .third(_items):
            return _items.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch items[indexPath.section] {
        case let .first(_items):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroImageCell", for: indexPath) as? HeroImageCell else {
                return UICollectionViewCell()
            }
            cell.configure(image: _items[indexPath.item].image)
            
            return cell
        case let .second(_items):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCell", for: indexPath) as? RecommendCell else {
                return UICollectionViewCell()
            }
            let item = _items[indexPath.item]
            cell.configure(image: item.image, title: item.title, distance: item.distance)
            
            return cell
        case let .third(_items):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LivingTravelCell", for: indexPath) as? LivingTravelCell else {
                return UICollectionViewCell()
            }
            let item = _items[indexPath.item]
            cell.configure(image: item.image, title: item.title)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionHeaderView", for: indexPath) as? CollectionHeaderView else {
                return UICollectionReusableView()
            }
            
            switch indexPath.section {
            case 1:
                headerView.configure(text: "가까운 여행지 둘러보기")
            case 2:
                headerView.configure(text: """
                                           어디에서나,
                                           여행은 살아보는거야!
                                           """)
            default:
                headerView.configure(text: nil)
            }
            
            return headerView
        default:
            return UICollectionReusableView()
        }
    }
}

enum MySection {
    case first([FirstItem])
    case second([SecondItem])
    case third([ThirdItem])
    
    struct FirstItem {
        let image: UIImage
    }
    
    struct SecondItem {
        let image: UIImage
        let title: String
        let distance: String
    }
    
    struct ThirdItem {
        let image: UIImage
        let title: String
    }
}
