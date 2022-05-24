//
//  HeroImageViewCell.swift
//  AirbnbApp
//
//  Created by dale on 2022/05/24.
//

import UIKit
import SnapKit

final class HeroImageViewCell: UICollectionViewCell {
    
    static var identifier: String {
        return "\(self)"
    }
    
    private lazy var heroImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "슬기로운 자연생활"
        label.lineBreakMode = .byWordWrapping
        label.font = .SFProDisplay.medium
        label.textColor = .Custom.black
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "메이스가 엄선한 위시리스트를 만나보세요"
        label.lineBreakMode = .byWordWrapping
        label.font = .SFProDisplay.regular
        label.textColor = .Custom.gray3
        return label
    }()
    
    private lazy var receiveIdeaButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.Custom.gray1
        button.titleLabel?.text = "여행 아이디어 얻기"
        button.setTitleColor(UIColor.Custom.white, for: .normal)
        return button
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutHeroImageView()
        layoutContainerStackView()
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

private extension HeroImageViewCell {
    
    func layoutHeroImageView() {
        addSubview(heroImageView)
        
        heroImageView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
            make.height.width.equalToSuperview()
        }
    }
    
    func layoutContainerStackView() {
        addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(titleLabel)
        containerStackView.addArrangedSubview(descriptionLabel)
        containerStackView.addArrangedSubview(receiveIdeaButton)
        
        containerStackView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
            
        }
    }
    
}

// MARK: - Providing Function

extension HeroImageViewCell {
    
    func setHeroImageView(image: UIImage) {
        heroImageView.image = image
    }
}
