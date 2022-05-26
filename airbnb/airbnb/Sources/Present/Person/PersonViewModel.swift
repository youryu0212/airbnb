//
//  CalenderViewModel.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/25.
//

import Foundation
import RxRelay
import RxSwift

final class PersonViewModel: PersonViewModelBinding, PersonViewModelAction, PersonViewModelState {
    func action() -> PersonViewModelAction { self }
    
    func state() -> PersonViewModelState { self }
    
    private let disposeBag = DisposeBag()
    
    init() {
    }
}
