//
//  FindAccomodationViewCont.swift
//  Airbnb_iOS
//
//  Created by 김한솔 on 2022/05/25.
//

import UIKit

final class FindAccomodationViewController: UIViewController {

    private lazy var findAccomodationView = FindAccomodationView(frame: view.frame)
    private var dataSource: [AccomodationDataSource] = [
        AccomodationDataSource(title: "위치"),
        AccomodationDataSource(title: "체크인/체크아웃"),
        AccomodationDataSource(title: "요금"),
        AccomodationDataSource(title: "인원")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "숙소 찾기"
        view = findAccomodationView
        navigationController?.hidesBarsOnSwipe = false
        findAccomodationView.setTableViewDateSource(self)
        findAccomodationView.setTableViewDelegate(self)
        setToolbar()
        findAccomodationView.setCalendarDelegate(self)
    }
}

private extension FindAccomodationViewController {
    func setToolbar() {
        navigationController?.isToolbarHidden = false
        let toolBarButtons = [
            UIBarButtonItem(title: "건너뛰기", style: .plain, target: self, action: #selector(skipButtonTouched)),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "다음", style: .plain, target: self, action: #selector(nextButtonTouched))
        ]
        toolbarItems = toolBarButtons
    }

    @objc func skipButtonTouched() {
        findAccomodationView.next()
    }

    @objc func nextButtonTouched() {
        print("Next")
    }
}

extension FindAccomodationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FindAccomodationCell.identifier, for: indexPath) as? FindAccomodationCell else {
            return UITableViewCell()
        }
        cell.setTitleLabel(dataSource[indexPath.row].title)
        cell.setDesctiption(dataSource[indexPath.row].data)

        return cell
    }
}

extension FindAccomodationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

extension FindAccomodationViewController: SelectCalendarDelegate {
    func didSetDate(_ dateRange: ClosedRange<Date>?) {
        guard let dateRange = dateRange else {
            return
        }

        let data = dateRange.description.components(separatedBy: [" ", "-", "+", "."])
                .filter { !$0.isEmpty }
                .compactMap { Int($0) }
        dataSource[0].data = "\(data[0])-\(data[1])-\(data[2])~\(data[4])-\(data[5])-\(data[6])"
        findAccomodationView.reloadCell()
    }
}

struct AccomodationDataSource {
    let title: String
    var data: String?
}
