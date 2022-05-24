//
//  DestinationCollecionViewDataSource.swift
//  AirbnbApp
//
//  Created by 김상혁 on 2022/05/23.
//

import UIKit

class DestinationCollecionViewDataSource: NSObject, UICollectionViewDataSource {
    
    let mockCells = ["서울", "광주", "부산", "대구"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DestinationCollectionViewCell.identifier, for: indexPath) as? DestinationCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(cityName: mockCells[indexPath.item])
        return cell
    }
}
