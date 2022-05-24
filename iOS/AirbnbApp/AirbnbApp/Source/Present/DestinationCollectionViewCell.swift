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
    
    private lazy var cityImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .red
        image.layer.cornerRadius = 10
        return image
    }()
    
    private lazy var cityTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .NotoSans.medium
        label.textColor = .Custom.gray1
        return label
    }()
    
    private lazy var distanceLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "차로 30분 거리"
        label.font = .NotoSans.regular
        label.textColor = .Custom.gray3
        return label
    }()
    
    private lazy var informationStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutCityImageView()
        layoutInformationStackView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init with coder is unavailable")
    }
    
}

// MARK: - View Layout

private extension DestinationCollectionViewCell {
    
    func layoutCityImageView() {
        addSubview(cityImageView)
        
        cityImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cityImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cityImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cityImageView.heightAnchor.constraint(equalToConstant: 74).isActive = true
        cityImageView.widthAnchor.constraint(equalToConstant: 74).isActive = true
    }
    
    func layoutInformationStackView() {
        addSubview(informationStackView)
        
        informationStackView.addArrangedSubview(cityTitleLabel)
        informationStackView.addArrangedSubview(distanceLabel)
        
        informationStackView.leadingAnchor.constraint(equalTo: cityImageView.trailingAnchor, constant: 16).isActive = true
        informationStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        informationStackView.centerYAnchor.constraint(equalTo: cityImageView.centerYAnchor).isActive = true
    }

}

// MARK: - Providing Function

extension DestinationCollectionViewCell {
    
    func configure(cityName: String) {
        cityTitleLabel.text = cityName
    }
    
    func configure(distance: String) {
        distanceLabel.text = distance
    }
}
