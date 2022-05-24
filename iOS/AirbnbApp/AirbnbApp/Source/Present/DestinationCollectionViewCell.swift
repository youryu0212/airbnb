//
//  DestinationCollectionViewCell.swift
//  AirbnbApp
//
//  Created by 김상혁 on 2022/05/23.
//

import UIKit

final class DestinationCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String {
        return "\(self)"
    }
 
    private lazy var cellView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init with coder is unavailable")
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        prepareForReuse(stackView: menuStackView.priceStackView)
//        prepareForReuse(stackView: menuStackView.badgeStackView)
//    }
    
//    private func prepareForReuse(stackView: UIStackView) {
//        stackView.subviews.forEach {
//            $0.removeFromSuperview()
//        }
//    }
    
    private func setUpView() {
        contentView.addSubview(cellView)
        cellView.backgroundColor = .red
        
        
        layoutCellView()
    }
}

// MARK: - View Layout

extension DestinationCollectionViewCell {
    private func layoutCellView() {
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
    }
}

// MARK: - Providing Function

extension DestinationCollectionViewCell {
    func setCityName(text: String) {
        
    }
}

