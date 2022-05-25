//
//  SearchOptionViewModelProtocol.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/25.
//

import Foundation
import RxRelay

protocol TravalOptionViewModelAction {
    var viewDidLoad: PublishRelay<Void> { get }
}

protocol TravalOptionViewModelState {
    var usingCategorys: PublishRelay<[TravalOptionInfo.OptionType]> { get }
    var updateTitle: PublishRelay<String> { get }
    var updateValue: PublishRelay<(Int, String)> { get }
}

protocol TravalOptionViewModelBinding {
    func action() -> TravalOptionViewModelAction
    func state() -> TravalOptionViewModelState
}

typealias TravalOptionViewModelProtocol = TravalOptionViewModelBinding
