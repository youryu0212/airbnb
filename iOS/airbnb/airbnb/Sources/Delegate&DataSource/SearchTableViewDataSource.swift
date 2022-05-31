//
//  SearchTableViewDataSource.swift
//  airbnb
//
//  Created by Jihee hwang on 2022/05/30.
//

import UIKit

class SearchTableViewDataSource: NSObject, UITableViewDataSource {
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
        return setUpCell(cell: cell, indexPath: indexPath)
    }
    
    private func setUpCell(cell: SearchTableViewCell, indexPath: IndexPath) -> SearchTableViewCell {
        let target = data[indexPath.section]
        
        cell.changeCity(city: target.city)
        cell.changeDistance(distance: target.distance)
        cell.changeCityImage(image: target.image)
        return cell
    }
}
