//
//  SearchViewModel.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/23.
//

import Foundation
import RxRelay
import RxSwift

protocol SearchViewModelAction {
    var loadAroundTraval: PublishRelay<Void> { get }
}

protocol SearchViewModelState {
    var loadedAroundTraval: PublishRelay<[AroundTraval]> { get }
}

protocol SearchViewModelBinding {
    func action() -> SearchViewModelAction
    func state() -> SearchViewModelState
}

typealias SearchViewModelProtocol = SearchViewModelBinding

final class SearchViewModel: SearchViewModelBinding, SearchViewModelAction, SearchViewModelState {
    func action() -> SearchViewModelAction { self }
    
    let loadAroundTraval = PublishRelay<Void>()
    
    func state() -> SearchViewModelState { self }
    
    let loadedAroundTraval = PublishRelay<[AroundTraval]>()
    
    @Inject(\.homeRepository) private var homeRepository: TravalRepository
    private let disposeBag = DisposeBag()
    
    init() {
        let requestAroundTraval = loadAroundTraval
            .withUnretained(self)
            .flatMapLatest { model, _ in
                model.homeRepository.requestAroundTraval()
            }
            .share()
        
        requestAroundTraval
            .compactMap { $0.value }
            .bind(to: loadedAroundTraval)
            .disposed(by: disposeBag)
    }
    
}
