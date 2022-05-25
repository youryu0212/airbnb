//
//  HomeController.swift
//  AirBnb
//
//  Created by 송태환 on 2022/05/23.
//

import SnapKit
import UIKit

class HomeController: UIViewController {
  private let scrollView = ScrollableView()

  private let searchBar: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .gray
    return textField
  }()

  // MARK: - Life Cycles

  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureUI()
  }

  // MARK: - UI Configuration

  private func configureUI() {
    self.navigationController?.navigationBar.isHidden = true
    self.view.backgroundColor = .systemBackground
    self.configureScrollView()
    self.configureSearchBar()
  }

  private func configureScrollView() {
    self.view.addSubview(self.scrollView)
    self.scrollView.contentView.snp.makeConstraints { make in
      make.height.greaterThanOrEqualTo(self.view.safeAreaLayoutGuide.snp.height)
    }

    self.scrollView.snp.makeConstraints { make in
      make.edges.equalTo(self.view.safeAreaLayoutGuide)
    }
  }

  private func configureSearchBar() {
    let searchBarWrapper = UIView()
    self.scrollView.addContent(searchBarWrapper)
    searchBarWrapper.addSubview(self.searchBar)

    let imageView = UIImageView(image: .magnifier)
    imageView.contentMode = .scaleAspectFit
    self.searchBar.leftView = imageView
    self.searchBar.leftViewMode = .always
    self.searchBar.layer.cornerRadius = 10
    self.searchBar.backgroundColor = .gray

    searchBarWrapper.snp.makeConstraints { make in
      make.top.equalTo(self.scrollView.contentView.snp.top)
      make.leading.equalTo(self.scrollView.contentView.snp.leading)
      make.trailing.equalTo(self.scrollView.contentView.snp.trailing)
    }

    self.searchBar.snp.makeConstraints { make in
			let edgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
      make.edges.equalTo(searchBarWrapper).inset(edgeInsets)
      make.height.equalTo(40)
    }
  }
}
