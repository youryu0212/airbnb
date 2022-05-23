//
//  SearchViewController.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/23.
//

import RxAppState
import RxDataSources
import RxSwift
import MapKit
import UIKit

final class SearchViewController: UIViewController {
    private let searchBarView: SearchBarView = {
        let searchView = SearchBarView()
        return searchView
    }()
    
    private let aroundView = SearchAroundView()
    private let searchResultView: SearchResultView = {
        let searchView = SearchResultView()
        searchView.isHidden = true
        return searchView
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
        
        viewModel.state().loadedAroundTraval
            .bind(to: aroundView.updateDataSource)
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
                vc.aroundView.isHidden = !isEmpty
                vc.searchResultView.isHidden = isEmpty
            })
            .disposed(by: disposeBag)
    }
    
    private func attribute() {
        title = "숙소 찾기"
        view.backgroundColor = .white
        searchCompleter.delegate = self
    }
    
    private func layout() {
        view.addSubview(searchBarView)
        view.addSubview(aroundView)
        view.addSubview(searchResultView)
        
        searchBarView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        aroundView.snp.makeConstraints {
            $0.top.equalTo(searchBarView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        searchResultView.snp.makeConstraints {
            $0.top.equalTo(searchBarView.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension SearchViewController: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        
        searchResultView.updateDataSource.accept(completer.results.map { $0.title })
    }
}
