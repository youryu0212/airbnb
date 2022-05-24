//
//  SearchViewController.swift
//  Airbnb
//
//  Created by YEONGJIN JANG on 2022/05/23.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "어디로 여행가세요?"
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        attribute()
    }
    
    private func attribute() {
        view.backgroundColor = .white
        contentView.backgroundColor = .white
        setUpSearchController()
        navAppearance()
    }
    
    private func layout() {
        view.addSubview(contentView)
        
        //MARK: - SnapKi
        contentView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}

extension SearchViewController: UISearchResultsUpdating {
    private func setUpSearchController() {
        searchController.searchResultsUpdater = self
        self.navigationItem.titleView = searchController.searchBar
        searchController.automaticallyShowsCancelButton = false
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        //TODO: - delegate 를 이용해서 필드가 활성화되면 1. 백버튼 추가, 2. 타이틀 추가
        //TODO: - 다른 탭으로 다녀오면 검색 창이 사라지는 버그 수정
        dump(searchController.searchBar.text)
        if searchController.isActive {
            navigationItem.titleView = nil
            navigationItem.searchController = self.searchController
            navigationItem.title = "숙소 찾기"
            
//            navigationItem.hidesBackButton = false
            navigationItem.backButtonTitle = "지우기"
            let backBarButton = UIBarButtonItem(title: "지우기", style: .plain, target: nil, action: nil)
            navigationItem.backBarButtonItem = backBarButton
        
            
            self.searchController.hidesNavigationBarDuringPresentation = false
            self.searchController.obscuresBackgroundDuringPresentation = false
        } else {
            navigationItem.searchController = nil
            navigationItem.titleView = self.searchController.searchBar
            
        }
    }
}

extension SearchViewController {
    private func navAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .yellow
        
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
}
