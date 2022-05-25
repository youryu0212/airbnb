//
//  CalenderViewModel.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/25.
//

import Foundation
import RxRelay
import RxSwift

final class CheckInOutViewModel: CheckInOutViewModelBinding, CheckInOutViewModelAction, CheckInOutViewModelState {
    func action() -> CheckInOutViewModelAction { self }
    
    func state() -> CheckInOutViewModelState { self }
    
    private let disposeBag = DisposeBag()
    
    init() {
        
    }
}
