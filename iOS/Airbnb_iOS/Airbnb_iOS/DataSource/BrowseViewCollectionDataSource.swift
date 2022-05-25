//
//  BrowseViewControllerDataSource.swift
//  Airbnb_iOS
//
//  Created by juntaek.oh on 2022/05/25.
//

import UIKit

class BrowseViewCollectionDataSource: NSObject, UICollectionViewDataSource {
    
    private var data: [SpotItem] = {
        [SpotItem].init(repeating: SpotItem(image: UIImage(named: "SeoulImage") ?? UIImage(), title: "서울", distance: "차로 30분 거리"), count: 20)
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
}

struct SpotItem {
    let image: UIImage
    let title: String
    let distance: String
}
