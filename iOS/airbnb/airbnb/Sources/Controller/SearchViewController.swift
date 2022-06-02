//
//  SearchViewController.swift
//  
//
//  Created by Jihee hwang on 2022/05/30.
//

import UIKit
import SnapKit

final class SearchViewController: UIViewController {
    
    private let searchTableView = UITableView(frame: .zero, style: .plain)
    private let dataSource = SearchTableViewDataSource()
    private let searchBarDelegate = SearchBarDelegate()
    
    private let navigationBarUnderLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .line
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 21, weight: .bold)
        label.text = Title.searchBarTableViewTitle
        return label
    }()
    
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = Title.searchBarPlaceholder
        searchController.obscuresBackgroundDuringPresentation = true
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        layout()
    }
    
    private func configureView() {
        title = "숙소 찾기"
        view.backgroundColor = .white
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = searchBarDelegate
        
        searchTableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        searchTableView.dataSource = dataSource
        searchTableView.separatorStyle = .none
    }
    
    private func layout() {
        view.addSubview(navigationBarUnderLineView)
        view.addSubview(titleLabel)
        view.addSubview(searchTableView)
        
        navigationBarUnderLineView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(1)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            $0.leading.equalTo(16)
        }
        
        searchTableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel).offset(40)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}
