//
//  SearchHomeViewModel.swift
//  AirbnbApp
//
//  Created by 김상혁 on 2022/05/25.
//

import Foundation

final class SearchHomeViewModel {
    
//    func action() -> ViewModelAction { self }
//    func state() -> ViewModelState { self }
    
    struct Action {
        let loadHeader = PublishRelay<Void>()
        let loadImage = PublishRelay<Void>()
        let loadCityName = PublishRelay<Void>()
        let loadTheme = PublishRelay<Void>()
    }
    
    struct State {
        let loadedHeader = PublishRelay<[String]>()
        let loadedImage = PublishRelay<String>()
        let loadedCityName = PublishRelay<[String]>()
        let loadedTheme = PublishRelay<[String]>()
    }
    
    var action = Action()
    var state = State()
    
    init() {
        // TODO: String -> Network Manager로부터 받아온 값을 넘겨주는 방식으로 변경
        action.loadHeader
            .bind(onNext: { [weak self] in
                self?.state.loadedHeader.accept(["", "가까운 여행지 둘러보기", "어디에서나, 여행은 살아보는거야!"])
            })
        
        action.loadImage
            .bind(onNext: { [weak self] in
                // TODO: Mock -> Network Manager로 받아온 URL 넘겨주는 방식으로 변경해보기
                self?.state.loadedImage.accept("mockimage.png")
            })
        
        action.loadCityName
            .bind(onNext: { [weak self] in
                self?.state.loadedCityName.accept(["서울", "광주", "부산", "대구"])
            })
        
        action.loadTheme
            .bind(onNext: { [weak self] in
                self?.state.loadedTheme.accept(["자연생활을 만끽할 수 있는 숙소", "독특한 공간"])
            })
    }
}

// MARK: - Providing Function

extension SearchHomeViewModel {
    
    func loadHeader(_ value: Void) {
        action.loadHeader.accept(value)
    }
    
    func loadImage(_ value: Void) {
        action.loadImage.accept(value)
    }
    
    func loadCityName(_ value: Void) {
        action.loadCityName.accept(value)
    }
    
    func loadTheme(_ value: Void) {
        action.loadTheme.accept(value)
    }
    
    func bindHeader(_ completion: @escaping ([String]) -> Void) {
        state.loadedHeader.bind(onNext: completion)
    }
    
    func bindImage(_ completion: @escaping (String) -> Void) {
        state.loadedImage.bind(onNext: completion)
    }
    
    func bindCityName(_ completion: @escaping ([String]) -> Void) {
        state.loadedCityName.bind(onNext: completion)
    }
    
    func bindTheme(_ completion: @escaping ([String]) -> Void) {
        state.loadedTheme.bind(onNext: completion)
    }
}
