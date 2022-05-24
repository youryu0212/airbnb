//
//  SearchBarView.swift
//  AirbnbApp
//
//  Created by 김상혁 on 2022/05/24.
//

import UIKit

class SearchBarView: UIView {
    
    private let textField = SearchTextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTextFieldDelegate(by delegate: TextFieldDelegate) {
        textField.delegate = delegate
    }
    
    private func configure() {
        backgroundColor = .systemGray6
    }
    
    private func layout() {
        addSubview(textField)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
}
