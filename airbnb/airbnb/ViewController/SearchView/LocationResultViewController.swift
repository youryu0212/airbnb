//
//  ResultController.swift
//  airbnb
//
//  Created by Bibi on 2022/05/26.
//

import UIKit

class LocationResultViewController: UITableViewController {
    
    private var resultList: [String] = ["결과1", "결과2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
        tableView.register(LocationResultViewCell.self, forCellReuseIdentifier: LocationResultViewCell.identifier)
    }
    
    private func setUI() {
    
//        let rightBarButtonItem = UIBarButtonItem(title: "지우기", style: .plain, target: self, action: #selector(eraseButtonClicked))
//        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationResultViewCell.identifier, for: indexPath) as? LocationResultViewCell else { return UITableViewCell() }
        let location = resultList[indexPath.row]
        cell.setTitle(location)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pushVC = LocationCalenderViewController()
        self.navigationController?.pushViewController(pushVC, animated: true) // navigationController가 nil
    }
    
    @objc func eraseButtonClicked() {
        self.navigationItem.searchController?.searchBar.text = ""
    }

    private func setConstraints() {
         tableView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: -40, right: -16)
    }
}
