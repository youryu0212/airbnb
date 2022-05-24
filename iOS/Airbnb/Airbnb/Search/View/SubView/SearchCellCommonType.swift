//
//  SearchCellCommonType.swift
//  Airbnb
//
//  Created by 백상휘 on 2022/05/24.
//

import Foundation
import UIKit

//protocol SearchCellCommonType {
//    static var reuseIdentifier: String { get }
//    func setData(model: SearchFavoriteLocationModel)
//}

class SearchCellCommonType: UICollectionViewCell {
    static var reuseIdentifier: String { String(describing: Self.self) }
    func setData(model: SearchFavoriteLocationModel) { }
}
