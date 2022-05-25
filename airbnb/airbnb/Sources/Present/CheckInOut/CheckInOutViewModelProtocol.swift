//
//  CalenderViewModelProtocol.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/25.
//

import Foundation
import RxRelay

protocol CheckInOutViewModelAction {
}

protocol CheckInOutViewModelState {
}

protocol CheckInOutViewModelBinding {
    func action() -> CheckInOutViewModelAction
    func state() -> CheckInOutViewModelState
}

typealias CheckInOutViewModelProtocol = CheckInOutViewModelBinding
