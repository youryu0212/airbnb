//
//  LocationTableViewCell.swift
//  airbnb
//
//  Created by Jihee hwang on 2022/06/02.
//

import UIKit
import SnapKit

final class LocationTableViewCell: UITableViewCell {
    static let identifier = "LocationTableViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 19, weight: .medium)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("Init with coder is unavailable")
    }
    
    private func layout() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
    }
}

extension LocationTableViewCell {
    func setData(title: String) {
        titleLabel.text = title
    }
}
