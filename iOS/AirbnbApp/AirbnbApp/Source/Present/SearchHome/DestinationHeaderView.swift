//
//  DestinationHeaderCollectionReusableView.swift
//  AirbnbApp
//
//  Created by 김상혁 on 2022/05/24.
//

import UIKit
import SnapKit

final class DestinationHeaderView: UICollectionReusableView {
    
    static var identifier: String {
        return "\(self)"
    }
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplay.regular(22)
        label.textColor = .Custom.black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutHeaderLabel()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init with coder is unavailable")
    }
}

// MARK: - View Layout

private extension DestinationHeaderView {
    
    func layoutHeaderLabel() {
        addSubview(headerLabel)
        
        headerLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - Providing Function

extension DestinationHeaderView {
    
    func setHeaderLabel(text: String) {
        headerLabel.text = text
    }
}
