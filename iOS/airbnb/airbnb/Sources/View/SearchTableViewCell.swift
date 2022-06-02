//
//  SearchTableViewCell.swift
//  airbnb
//
//  Created by Jihee hwang on 2022/05/30.
//

import UIKit
import SnapKit

final class SearchTableViewCell: UITableViewCell {
    static let identifier = "SearchTableViewCell"
    
    private let cityImageView = UIImageView()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let distanceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .grey3
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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected {
            contentView.layer.backgroundColor = UIColor.grey5.cgColor
        } else {
            contentView.layer.backgroundColor = UIColor.white.cgColor
        }
    }
    
    private func layout() {
        contentView.addSubview(cityImageView)
        contentView.addSubview(stackView)

        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(distanceLabel)

        cityImageView.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.leading.equalTo(contentView.snp.leading).offset(16)
            $0.width.height.equalTo(65)
        }
        
        stackView.snp.makeConstraints {
            $0.centerY.equalTo(cityImageView)
            $0.leading.equalTo(cityImageView.snp.trailing).offset(16)
            $0.trailing.equalTo(contentView.snp.trailing).offset(-16)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-20)
        }
    }
}

extension SearchTableViewCell {
    func changeCityImage(image: String) {
        cityImageView.image = UIImage(named: "\(image)")
    }
    
    func changeCity(city: String) {
        cityLabel.text = city
    }
    
    func changeDistance(distance: String) {
        distanceLabel.text = distance
    }
}
