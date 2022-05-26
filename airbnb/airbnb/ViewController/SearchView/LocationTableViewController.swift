import UIKit

class LocationTableViewController: UITableViewController {

    var locationList: [[String]] = [["서울", "차로 30분 거리"], ["광주", "차로 4시간 거리"]]
    private var searchText = ""
    
    private let resultController = LocationResultViewController()

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
        cell.selectionStyle = .none
        cell.setTitle(location[0])
        cell.setDistance(location[1])
        return cell
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: .init(x: 0, y: 0, width: tableView.frame.width, height: 32))
        let label = UILabel(frame: .init(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        label.text = "근처의 인기 여행지"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        view.addSubview(label)

        return view
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }

    private func setUI() {
        self.navigationItem.title = "숙소 찾기"
        
        let rightBarButtonItem = UIBarButtonItem(title: "지우기", style: .plain, target: self, action: #selector(eraseButtonClicked))
        resultController.navigationItem.rightBarButtonItem = rightBarButtonItem
        let searchController = UISearchController(searchResultsController: resultController)
        
        searchController.delegate = self
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController

        tableView.separatorStyle = .none
        
        self.navigationItem.hidesSearchBarWhenScrolling = false // navigationBar 내의 searchBar 항상 보이기
        self.navigationItem.searchController?.hidesNavigationBarDuringPresentation = false
        self.navigationItem.searchController?.searchBar.placeholder = "어디로 여행가세요?"
        self.navigationItem.searchController?.searchBar.showsCancelButton = false
    
        
        
    }
    
    @objc func eraseButtonClicked() {
        self.navigationItem.searchController?.searchBar.text = ""
    }

    private func setConstraints() {
        tableView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: -40, right: -16)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
//            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
//        ])
        
    }
}

extension LocationTableViewController: UISearchControllerDelegate, UISearchBarDelegate {
    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
}

