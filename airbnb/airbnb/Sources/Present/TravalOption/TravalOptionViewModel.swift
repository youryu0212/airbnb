//
//  SearchOptionViewModel.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/25.
//

import Foundation
import RxRelay
import RxSwift

final class TravalOptionViewModel: TravalOptionViewModelBinding, TravalOptionViewModelAction, TravalOptionViewModelState, TravalOptionViewModelProperty {
    func action() -> TravalOptionViewModelAction { self }
    
    let viewDidLoad = PublishRelay<Void>()
    
    func state() -> TravalOptionViewModelState { self }
    
    let usingCategorys = PublishRelay<[TravalOptionInfo.OptionType]>()
    let updateTitle = PublishRelay<String>()
    let updateValue = PublishRelay<(Int, String)>()
    let showCategoryPage = BehaviorRelay<TravalOptionInfo.OptionType>(value: .checkInOut)
    
    let priceViewModel: PriceViewModelProtocol = PriceViewModel()
    let checkInOutViewModel: CheckInOutViewModelProtocol = CheckInOutViewModel()
    let personViewModel: PersonViewModelProtocol = PersonViewModel()
    
    private var option: [TravalOptionInfo.OptionType: Any?] = [:]
    private let disposeBag = DisposeBag()
    
    init(type: TravalOptionInfo.ViewType) {
        var optionTypes: [TravalOptionInfo.OptionType]
        switch type {
        case .search:
            optionTypes = [.location, .checkInOut, .rangePrice, .person]
        case .reservation:
            optionTypes = [.checkInOut, .person]
        }
        optionTypes.forEach { option[$0] = "" }
        
        viewDidLoad
            .map { _ in optionTypes }
            .bind(to: usingCategorys)
            .disposed(by: disposeBag)
        
        viewDidLoad
            .map { _ in type.title }
            .bind(to: updateTitle)
            .disposed(by: disposeBag)
    }
    
    convenience init(location: String) {
        self.init(type: .search)
        option[.location] = location
        
        viewDidLoad
            .map { _ in (TravalOptionInfo.OptionType.location.index, location) }
            .bind(to: updateValue)
            .disposed(by: disposeBag)
    }
}
