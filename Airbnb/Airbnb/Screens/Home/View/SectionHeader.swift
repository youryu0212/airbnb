//
//  Header.swift
//  Airbnb
//
//  Created by Kai Kim on 2022/05/25.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    static let id = "SectionHeader"

    override init(frame: CGRect) {
        super.init(frame: frame)

        let label = UILabel()
        label.text = "가까운 여행지 둘러보기"
        label.numberOfLines = 0
        self.addSubview(label)
        label.frame = bounds
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
