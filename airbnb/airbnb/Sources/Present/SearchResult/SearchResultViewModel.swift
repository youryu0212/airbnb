//
//  SearchResultViewModel.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/24.
//

import Foundation
import RxRelay
import RxSwift

final class SearchResultViewModel: SearchResultViewModelBinding, SearchResultViewModelAction, SearchResultViewModelState {
    func action() -> SearchResultViewModelAction { self }
    
    func state() -> SearchResultViewModelState { self }
    
    let updatedSearchResult = PublishRelay<[String]>()
    
    init() {
    }
}
