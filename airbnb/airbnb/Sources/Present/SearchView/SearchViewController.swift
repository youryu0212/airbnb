//
//  SearchViewController.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/23.
//

import MapKit
import RxAppState
import RxDataSources
import RxSwift
import UIKit

final class SearchViewController: UIViewController {
    private let searchBarView: SearchBarView = {
        let searchView = SearchBarView()
        return searchView
    }()
    
    private lazy var arroundTravalViewController: ArroundTravalLargeViewController = {
        ArroundTravalLargeViewController(viewModel: viewModel.arroundTravelViewModel)
    }()
    
    private lazy var searchResultViewController: SearchResultViewController = {
        let viewController = SearchResultViewController(viewModel: viewModel.searchResultTravelViewModel)
        viewController.view.isHidden = true
        return viewController
    }()
    
    private let searchClearButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "지우기"
        return button
    }()
    
    private let viewModel: SearchViewModelProtocol
    private let disposeBag = DisposeBag()
    
    private var searchCompleter: MKLocalSearchCompleter = {
        let completer = MKLocalSearchCompleter()
        completer.resultTypes = .address
        completer.region = MKCoordinateRegion(MKMapRect.world)
        return completer
    }()
    
    var completerResults: [MKLocalSearchCompletion]?
    
    init(viewModel: SearchViewModelProtocol) {
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
        rx.viewDidLoad
            .bind(to: viewModel.action().loadAroundTraval)
            .disposed(by: disposeBag)
        
        rx.viewWillAppear
            .withUnretained(self)
            .bind(onNext: { vc, _ in
                vc.tabBarController?.tabBar.isHidden = true
            })
            .disposed(by: disposeBag)
        
        rx.viewWillDisappear
            .withUnretained(self)
            .bind(onNext: { vc, _ in
                vc.tabBarController?.tabBar.isHidden = false
            })
            .disposed(by: disposeBag)
        
        searchBarView.text
            .compactMap { $0 }
            .withUnretained(self)
            .bind(onNext: { vc, text in
                vc.searchCompleter.queryFragment = text
            })
            .disposed(by: disposeBag)
        
        searchBarView.text
            .map { text -> Bool in
                if let text = text {
                    return text.isEmpty
                }
                return true
            }
            .withUnretained(self)
            .bind(onNext: { vc, isEmpty in
                vc.arroundTravalViewController.view.isHidden = !isEmpty
                vc.searchResultViewController.view.isHidden = isEmpty
            })
            .disposed(by: disposeBag)
        
        searchClearButton.rx.tap
            .mapVoid()
            .bind(to: searchBarView.clear)
            .disposed(by: disposeBag)
    }
    
    private func attribute() {
        title = "숙소 찾기"
        navigationItem.rightBarButtonItem = searchClearButton
        view.backgroundColor = .white
        searchCompleter.delegate = self
    }
    
    private func layout() {
        view.addSubview(searchBarView)
        view.addSubview(arroundTravalViewController.view)
        view.addSubview(searchResultViewController.view)
        
        searchBarView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        arroundTravalViewController.view.snp.makeConstraints {
            $0.top.equalTo(searchBarView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        searchResultViewController.view.snp.makeConstraints {
            $0.top.equalTo(searchBarView.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension SearchViewController: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        viewModel.action().updateSearchResult.accept(completer.results.map { $0.title })
    }
}
