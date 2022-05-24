//
//  SearchTextField.swift
//  AirbnbApp
//
//  Created by 김상혁 on 2022/05/24.
//

import UIKit

class SearchTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        addLeftImage()
        setPlaceholderColor()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .Custom.gray5
        layer.cornerRadius = 10
    }
    
    private func addLeftImage() {
        let leftimage = UIImage(systemName: "magnifyingglass")?
            .withTintColor(.Custom.gray3, renderingMode: .alwaysOriginal) ?? UIImage()
        let leftImageView = UIImageView(image: leftimage)
        leftView = leftImageView
        leftViewMode = .always
    }
    
    private func setPlaceholderColor() {
        attributedPlaceholder = NSAttributedString(
            string: "어디로 여행가세요?",
            attributes: [
                .foregroundColor: UIColor.Custom.gray3])
    }
}
