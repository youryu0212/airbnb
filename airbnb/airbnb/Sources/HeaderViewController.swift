//
//  HeaderViewController.swift
//  airbnb
//
//  Created by Jihee hwang on 2022/05/25.
//

import UIKit
import SnapKit

class HeaderViewController: UIViewController {
    
    private let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .grey4
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        layout()
    }
    
    private func configureView() {
        view.backgroundColor = .white
    }
    
    private func layout() {
        view.addSubview(underLineView)
        
        underLineView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(1)
        }
    }
}
