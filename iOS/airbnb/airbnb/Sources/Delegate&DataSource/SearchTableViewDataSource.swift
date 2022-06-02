//
//  SearchTableViewDataSource.swift
//  airbnb
//
//  Created by Jihee hwang on 2022/05/30.
//

import UIKit

final class SearchTableViewDataSource: NSObject, UITableViewDataSource {
    
    let data = Dummy.dataList
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        return makeCell(cell: cell, indexPath: indexPath)
    }
    
    private func makeCell(cell: SearchTableViewCell, indexPath: IndexPath) -> SearchTableViewCell {
        let target = data[indexPath.section]
        
        cell.setData(image: target.image, city: target.city, distance: target.distance)
        return cell
    }
}
