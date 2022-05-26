//
//  CalenderCellViewModelProtocol.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/25.
//

import Foundation
import RxRelay

protocol CalenderCellViewModelAction {
    var tappedCell: PublishRelay<Date> { get }
}

protocol CalenderCellViewModelState {
    var updateState: BehaviorRelay<CalenderCellState> { get }
    
    var date: Date? { get }
}

protocol CalenderCellViewModelBinding {
    func action() -> CalenderCellViewModelAction
    func state() -> CalenderCellViewModelState
}

typealias CalenderCellViewModelProtocol = CalenderCellViewModelBinding

enum CalenderCellState {
    case none
    case start
    case end
    case inRange
}
