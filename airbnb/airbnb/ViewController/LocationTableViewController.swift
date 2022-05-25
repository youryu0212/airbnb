import UIKit

class LocationTableViewController: UITableViewController {

    var locationList: [[String]] = [["서울", "차로 30분 거리"], ["광주", "차로 4시간 거리"]]
    private var searchText = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
        tableView.register(LocationTableViewCell.self, forCellReuseIdentifier: LocationTableViewCell.identifier)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.identifier, for: indexPath) as? LocationTableViewCell else { return UITableViewCell() }
        let location = locationList[indexPath.row]
        cell.setTitle(location[0])
        cell.setDistance(location[1])
        return cell
    }

    private func setUI() {
        self.navigationItem.title = "숙소 찾기"

        let searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }

    private func setConstraints() {
    }
}

extension LocationTableViewController: UISearchControllerDelegate, UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
}

