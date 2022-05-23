//
//  SearchViewController.swift
//  Airbnb
//
//  Created by YEONGJIN JANG on 2022/05/23.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    private let backgroundScroll: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        attribute()
    }
    
    private func attribute() {
        view.backgroundColor = .white
        contentView.backgroundColor = .brown
    }
    
    private func layout() {
        view.addSubview(backgroundScroll)
        backgroundScroll.addSubview(contentView)

        //MARK: - SnapKit
        backgroundScroll.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }

        contentView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalTo(backgroundScroll.contentLayoutGuide)
            $0.width.equalTo(backgroundScroll.frameLayoutGuide)
            $0.height.greaterThanOrEqualTo(view).priority(.low)
        }
    }
}
