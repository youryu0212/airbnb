//
//  ArroundTravalViewModel.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/24.
//

import Foundation
import RxRelay
import RxSwift

final class ArroundTravalViewModel: ArroundTravalViewModelBinding, ArroundTravalViewModelAction, ArroundTravalViewModelState {
    func action() -> ArroundTravalViewModelAction { self }
    
    let loadArroundTravel = PublishRelay<Void>()
    
    func state() -> ArroundTravalViewModelState { self }
    
    let loadedAroundTraval = PublishRelay<[AroundTraval]>()
    
    @Inject(\.homeRepository) private var homeRepository: TravalRepository
    private let disposeBag = DisposeBag()
    
    init() {
        let requestAroundTraval = loadArroundTravel
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
