//
//  NewCalenderCellViewModel.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/26.
//

import Foundation
import RxRelay
import RxSwift

final class CalenderCellViewModel: CalenderCellViewModelBinding, CalenderCellViewModelAction, CalenderCellViewModelState {
    func action() -> CalenderCellViewModelAction { self }
    
    let tappedCell = PublishRelay<Date>()
    
    func state() -> CalenderCellViewModelState { self }
    
    let updateState = BehaviorRelay<CalenderCellState>(value: .none)
    let date: Date?
    
    init(date: Date?) {
        self.date = date
    }
}
