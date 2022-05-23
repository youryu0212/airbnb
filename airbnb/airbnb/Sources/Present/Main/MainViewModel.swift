//
//  MainViewModel.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/23.
//

import Foundation
import RxRelay
import RxSwift

protocol MainViewModelAction {
    var loadHome: PublishRelay<Void> { get }
}

protocol MainViewModelState {
    var loadedHeroImage: PublishRelay<URL> { get }
    var loadedAroundTraval: PublishRelay<[AroundTraval]> { get }
    var loadedRecommandTraval: PublishRelay<[RecommandTraval]> { get }
}

protocol MainViewModelBinding {
    func action() -> MainViewModelAction
    func state() -> MainViewModelState
}

typealias MainViewModelProtocol = MainViewModelBinding

final class MainViewModel: MainViewModelBinding, MainViewModelAction, MainViewModelState {
    func action() -> MainViewModelAction { self }
    
    let loadHome = PublishRelay<Void>()
    
    func state() -> MainViewModelState { self }
    
    let loadedHeroImage = PublishRelay<URL>()
    let loadedAroundTraval = PublishRelay<[AroundTraval]>()
    let loadedRecommandTraval = PublishRelay<[RecommandTraval]>()
    
    @Inject(\.homeRepository) private var homeRepository: HomeRepository
    private let disposeBag = DisposeBag()
    
    init() {
        let requestAroundTraval = loadHome
            .withUnretained(self)
            .flatMapLatest { model, _ in
                model.homeRepository.requestAroundTraval()
            }
            .share()
        
        requestAroundTraval
            .compactMap { $0.value }
            .bind(to: loadedAroundTraval)
            .disposed(by: disposeBag)
        
        loadHome
            .compactMap { URL(string: "https://user-images.githubusercontent.com/5019378/169792466-371c2b29-2869-4335-8c07-d20488fc9035.png") }
            .bind(to: loadedHeroImage)
            .disposed(by: disposeBag)
        
        let requestRecommandTraval = loadHome
            .withUnretained(self)
            .flatMapLatest { model, _ in
                model.homeRepository.requestRecommandTraval()
            }
            .share()
        
        requestRecommandTraval
            .compactMap { $0.value }
            .bind(to: loadedRecommandTraval)
            .disposed(by: disposeBag)
    }
}
