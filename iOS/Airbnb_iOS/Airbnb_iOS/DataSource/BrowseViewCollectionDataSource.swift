//
//  BrowseViewControllerDataSource.swift
//  Airbnb_iOS
//
//  Created by juntaek.oh on 2022/05/25.
//

import UIKit

class BrowseViewCollectionDataSource: NSObject, UICollectionViewDataSource {
    
    private var data: [SpotItem] = {
        [SpotItem].init(repeating: SpotItem(image: UIImage(named: "SeoulImage") ?? UIImage(), title: "서울", distance: "차로 30분 거리"), count: 8)
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AroundSpotCell.identifier, for: indexPath) as? AroundSpotCell else {
            return UICollectionViewCell()
        }
        
        let item = data[indexPath.item]
        cell.configure(image: item.image, title: item.title, distance: item.distance)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionHeaderView.identifier, for: indexPath) as? CollectionHeaderView else {
            return UICollectionReusableView()
        }
        
        headerView.setHeaderText(text: "근처의 인기 여행지")
        headerView.setHeaderFontSize(size: 17)
    
        return headerView
    }
}

struct SpotItem {
    let image: UIImage
    let title: String
    let distance: String
}
