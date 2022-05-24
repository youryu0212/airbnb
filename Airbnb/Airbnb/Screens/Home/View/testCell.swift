//
//  testCell.swift
//  Airbnb
//
//  Created by Kai Kim on 2022/05/25.
//

import UIKit

class testCell: UICollectionViewCell {
    static let id = "testCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .brown
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
