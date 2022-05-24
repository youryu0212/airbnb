//
//  SearchCellCommonType.swift
//  Airbnb
//
//  Created by 백상휘 on 2022/05/24.
//

import Foundation
protocol SearchCellCommonType {
    static var reuseIdentifier: String { get }
    func setData(model: SearchFavoriteLocationModel)
}
