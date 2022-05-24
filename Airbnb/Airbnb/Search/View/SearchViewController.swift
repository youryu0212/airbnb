//
//  SearchViewController.swift
//  Airbnb
//
//  Created by YEONGJIN JANG on 2022/05/23.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    private let backgroundScroll: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        attribute()
    }
    
    private func attribute() {
        view.backgroundColor = .white
        contentView.backgroundColor = .brown
        setUpSearchController()
    }
    
    private func layout() {
        view.addSubview(backgroundScroll)
        backgroundScroll.addSubview(contentView)
    
        //MARK: - SnapKit
        backgroundScroll.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }

        contentView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalTo(backgroundScroll.contentLayoutGuide)
            $0.width.equalTo(backgroundScroll.frameLayoutGuide)
            $0.height.greaterThanOrEqualTo(view).priority(.low)
        }
    }
}

extension SearchViewController: UISearchResultsUpdating {
    private func setUpSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "어디로 여행가세요?"
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.automaticallyShowsCancelButton = false
        
        searchController.searchResultsUpdater = self
        
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        //TODO: - delegate 를 이용해서 필드가 활성화되면 1. 백버튼 추가, 2. 타이틀 추가
        if searchController.isActive {
            self.navigationItem.title = "숙소 찾기"
            self.navigationItem.hidesBackButton = false
        }
    }
}

