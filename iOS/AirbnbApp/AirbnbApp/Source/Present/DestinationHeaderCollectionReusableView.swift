//
//  DestinationHeaderCollectionReusableView.swift
//  AirbnbApp
//
//  Created by 김상혁 on 2022/05/24.
//

import UIKit

class DestinationHeaderCollectionReusableView: UICollectionReusableView {
    static var identifier: String {
        return "\(self)"
    }
    
    private let sectionHeaderView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "가까운 여행지 둘러보기"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerLabel)
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init with coder is unavailable")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        setTitle(title: nil)
//        if isCountLableVisible() {
//            sectionCountLabel.removeFromSuperview()
//        }
    }
    
}
