//
//  CalenderViewController.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/25.
//

import RxSwift
import UIKit

final class CheckInOutViewController: UIViewController {
    
    private let viewModel: CheckInOutViewModelProtocol
    private let disposeBag = DisposeBag()
    
    init(viewModel: CheckInOutViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bind()
        attribute()
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bind() {
    }
    
    private func attribute() {
        view.backgroundColor = .red
    }
    
    private func layout() {
    }
}
