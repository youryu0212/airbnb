//
//  SearchViewController.swift
//  
//
//  Created by Jihee hwang on 2022/05/30.
//

import UIKit
import SnapKit
import MapKit

final class SearchViewController: UIViewController {
    
    private let cityData = CityData.dataList

    private let tableView = UITableView(frame: .zero, style: .plain)
    private var searchCompleter = MKLocalSearchCompleter() // 자동완성 도와주는 객체
    private var searchResult = [MKLocalSearchCompletion]() // 자동완성한 결과를 담는 객체
    private var isSearching = false
    
    private lazy var rightButton = UIBarButtonItem(title: "지우기", style: .plain, target: self, action: #selector(didTabRemoveButton))

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
        
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.becomeFirstResponder() // First Responder 로 지정
        
        rightButton.tintColor = .gray3
        
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false // 네비게이션 타이틀 유지
        searchController.automaticallyShowsCancelButton = false
        // cancle 버튼 삭제
        
        tableView.register(CityViewCell.self, forCellReuseIdentifier: CityViewCell.identifier)
        tableView.register(LocationTableViewCell.self, forCellReuseIdentifier: LocationTableViewCell.identifier)
        tableView.dataSource = self
        
        searchCompleter.delegate = self
    }
    
    private func layout() {
        view.addSubview(navigationBarUnderLineView)
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
        navigationBarUnderLineView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(1)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            $0.leading.equalTo(16)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel).offset(40)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    @objc func didTabRemoveButton(_ sender: Any) {
        searchController.searchBar.text = ""
        isSearching = false
        tableView.reloadData()
    }
}

// MARK: - extension

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            isSearching = false
            tableView.reloadData()
        } else {
            isSearching = true
            searchCompleter.queryFragment = searchText
            
        }
    }
}

extension SearchViewController: MKLocalSearchCompleterDelegate {
    // 자동완성 시 결과를 받는 함수
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResult = completer.results
        tableView.reloadData()
    }
}

extension SearchViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        isSearching ? 1 : cityData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isSearching ? searchResult.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isSearching {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.identifier, for: indexPath) as? LocationTableViewCell else {
                return UITableViewCell()
            }
            return makeLocationCell(cell: cell, indexPath: indexPath)
        } else {
            tableView.separatorColor = .clear
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CityViewCell.identifier, for: indexPath) as? CityViewCell else {
                return UITableViewCell()
            }
            return makeCityCell(cell: cell, indexPath: indexPath)
        }
    }
    
    private func makeLocationCell(cell: LocationTableViewCell, indexPath: IndexPath) -> LocationTableViewCell {
        let target = searchResult[indexPath.row]
        
        cell.setData(title: target.title)
        return cell
    }
    
    private func makeCityCell(cell: CityViewCell, indexPath: IndexPath) -> CityViewCell {
        let target = cityData[indexPath.section]
        
        cell.setData(image: target.image, city: target.city, distance: target.distance)
        return cell
    }
}
