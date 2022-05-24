//
//  SearchResultViewModelProtocol.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/24.
//

import Foundation
import RxRelay

protocol SearchResultViewModelAction {
}

protocol SearchResultViewModelState {
    var updatedSearchResult: PublishRelay<[String]> { get }
}

protocol SearchResultViewModelBinding {
    func action() -> SearchResultViewModelAction
    func state() -> SearchResultViewModelState
}

typealias SearchResultViewModelProtocol = SearchResultViewModelBinding
