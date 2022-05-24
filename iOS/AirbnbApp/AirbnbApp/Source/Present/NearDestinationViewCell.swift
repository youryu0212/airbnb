//
//  NearDestinationViewCell.swift
//  AirbnbApp
//
//  Created by 김상혁 on 2022/05/23.
//

import UIKit
import SnapKit

final class NearDestinationViewCell: UICollectionViewCell {
    
    static var identifier: String {
        return "\(self)"
    }
    
    private lazy var cityImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        return image
    }()
    
    private lazy var cityTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .NotoSans.medium
        label.textColor = .Custom.gray1
        return label
    }()
    
    private lazy var distanceLabel: UILabel = {
        let label = UILabel()
        label.text = "차로 30분 거리"
        label.font = .NotoSans.regular
        label.textColor = .Custom.gray3
        return label
    }()
    
    private lazy var informationStackView: UIStackView = {
        let stackView = UIStackView()
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

// MARK: - View Layout

private extension NearDestinationViewCell {
    
    func layoutCityImageView() {
        addSubview(cityImageView)
        
        cityImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.height.width.equalTo(74)
        }
    }
    
    func layoutInformationStackView() {
        addSubview(informationStackView)
        informationStackView.addArrangedSubview(cityTitleLabel)
        informationStackView.addArrangedSubview(distanceLabel)
        
        informationStackView.snp.makeConstraints { make in
            make.leading.equalTo(cityImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview()
            make.centerY.equalTo(cityImageView.snp.centerY)
        }
    }
    
}

// MARK: - Providing Function

extension NearDestinationViewCell {
    
    func setCityImageView(image: UIImage) {
        cityImageView.image = image
    }
    
    func setCityTitleLabel(text: String) {
        cityTitleLabel.text = text
    }
    
    func setDistanceLabel(text: String) {
        distanceLabel.text = text
    }
}
