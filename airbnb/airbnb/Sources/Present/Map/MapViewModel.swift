//
//  MapViewModel.swift
//  airbnb
//
//  Created by 김동준 on 2022/05/23.
//

import RxSwift
import RxRelay
import RxAppState

protocol MapViewModelAction {
    var viewLifeChanged: PublishRelay<ViewControllerViewState> { get }
    
}

protocol MapViewModelState {
    var viewLifeCycle: PublishRelay<ViewControllerViewState> { get }
}

protocol MapViewModelBinding {
    func action() -> MapViewModelAction
    func state() -> MapViewModelState
}

typealias MapViewModelProtocol = MapViewModelBinding

final class MapViewModel: MapViewModelBinding, MapViewModelAction, MapViewModelState {
    private let disposeBag = DisposeBag()
    
    var viewLifeCycle = PublishRelay<ViewControllerViewState>()
    var viewLifeChanged = PublishRelay<ViewControllerViewState>()
    
    func action() -> MapViewModelAction { self }
    func state() -> MapViewModelState { self }
    
    init() {
        viewLifeCycle
            .filter { $0 == .viewDidLoad }
            .bind(to: viewLifeCycle)
            .disposed(by: disposeBag)
    }
}
