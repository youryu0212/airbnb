//
//  DestinationHeaderCollectionReusableView.swift
//  AirbnbApp
//
//  Created by 김상혁 on 2022/05/24.
//

import UIKit
import SnapKit

class DestinationHeaderView: UICollectionReusableView {
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
        label.font = UIFont.SFProDisplay.regular
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
