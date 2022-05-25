//
//  SearchHomeViewModel.swift
//  AirbnbApp
//
//  Created by 김상혁 on 2022/05/25.
//

import Foundation

protocol ViewModelProtocol {
    associatedtype Action
    associatedtype State
    
    var action: Action { get }
    var state: State { get }
}

final class SearchHomeViewModel: ViewModelProtocol {
    
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
