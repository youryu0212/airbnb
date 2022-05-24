//
//  SearchViewModel.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/23.
//

import Foundation
import RxRelay
import RxSwift

final class SearchViewModel: SearchViewModelBinding, SearchViewModelProperty, SearchViewModelAction, SearchViewModelState {
    func action() -> SearchViewModelAction { self }
    
    let loadAroundTraval = PublishRelay<Void>()
    let updateSearchResult = PublishRelay<[String]>()
    
    func state() -> SearchViewModelState { self }
    
    let loadedAroundTraval = PublishRelay<[AroundTraval]>()
    
    let arroundTravelViewModel: ArroundTravalViewModelProtocol = ArroundTravalViewModel()
    let searchResultTravelViewModel: SearchResultViewModelProtocol = SearchResultViewModel()
    
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
        
        updateSearchResult
            .bind(to: searchResultTravelViewModel.state().updatedSearchResult)
            .disposed(by: disposeBag)
    }
}
