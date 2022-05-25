//
//  BrowseViewController.swift
//  Airbnb_iOS
//
//  Created by juntaek.oh on 2022/05/24.
//

import UIKit

class BrowseViewController: UIViewController {

    private lazy var nextVCButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("다음 화면", for: .normal)
        if #available(iOS 14.0, *) {
            button.addAction(UIAction(handler: { _ in
                let nextVC = FindAccomodationViewController()
                self.navigationController?.pushViewController(nextVC, animated: true)
            }), for: .touchUpInside)
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        view.addSubview(nextVCButton)
        NSLayoutConstraint.activate([
            nextVCButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextVCButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextVCButton.heightAnchor.constraint(equalToConstant: 100),
            nextVCButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
