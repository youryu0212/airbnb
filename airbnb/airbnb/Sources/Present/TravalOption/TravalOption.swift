//
//  TravalOption.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/25.
//

import Foundation

public class TravalOptionInfo {
    public typealias CheckInOut = (Date, Date)
    public typealias Price = (Float, Float)
    
    public private(set) var location: String?
    public private(set) var checkInOut: CheckInOut?
    public private(set) var rangePrice: Price?
    public private(set) var person: Int?
}

extension TravalOptionInfo {
    enum ViewType {
        case search
        case reservation
        
        var title: String {
            switch self {
            case .search: return "숙소 찾기"
            case .reservation: return "숙소 예약"
            }
        }
    }

    enum OptionType: CaseIterable {
        case location
        case checkInOut
        case rangePrice
        case person
        
        var index: Int {
            switch self {
            case .location: return 0
            case .checkInOut: return 1
            case .rangePrice: return 2
            case .person: return 3
            }
        }
        
        var name: String {
            switch self {
            case .location: return "위치"
            case .checkInOut: return "체크인/체크아웃"
            case .rangePrice: return "요금"
            case .person: return "인원"
            }
        }
    }
}
