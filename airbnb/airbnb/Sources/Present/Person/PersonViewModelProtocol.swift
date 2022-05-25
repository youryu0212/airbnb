//
//  CalenderViewModelProtocol.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/25.
//

import Foundation
import RxRelay

protocol PersonViewModelAction {
}

protocol PersonViewModelState {
}

protocol PersonViewModelBinding {
    func action() -> PersonViewModelAction
    func state() -> PersonViewModelState
}

typealias PersonViewModelProtocol = PersonViewModelBinding
