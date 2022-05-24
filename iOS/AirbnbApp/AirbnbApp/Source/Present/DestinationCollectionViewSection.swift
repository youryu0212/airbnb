//
//  DestinationCollectionViewSection.swift
//  AirbnbApp
//
//  Created by dale on 2022/05/24.
//

import Foundation

enum DestinationCollectionViewSection: Int, Hashable, CaseIterable, CustomStringConvertible {
    case image, nearby, theme
    
    var description: String {
        switch self {
        case .image:
            return "Image"
        case.nearby:
            return "NearBy"
        case .theme:
            return "Theme"
        }
    }
}
