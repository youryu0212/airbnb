import UIKit

class LocationTableViewController: UITableViewController {

    var locationList: [[String]] = [["서울", "차로 30분 거리"], ["광주", "차로 4시간 거리"]]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(LocationTableViewCell.self, forCellReuseIdentifier: LocationTableViewCell.identifier)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.identifier, for: indexPath) as? LocationTableViewCell else { return UITableViewCell() }
        let location = locationList[indexPath.row]
        cell.setTitle(location[0])
        cell.setDistance(location[1])
        return cell

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationList.count
    }
}
