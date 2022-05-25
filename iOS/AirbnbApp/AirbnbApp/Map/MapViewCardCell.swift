//
//  MapViewCardCell.swift
//  AirbnbApp
//
//  Created by 박진섭 on 2022/05/25.
//

import UIKit
import SnapKit

final class MapViewCardCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var reviewLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.configuration = UIButton.Configuration.plain()
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setUp()
        configureHeartButtonTapped()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Text별 색상과 속성을 다르게 줌.
    func setReviewLabel(rating: Double, reviewCount: Int) {
        let labelText = NSMutableAttributedString()
        
        // 별표
        guard let starImage = UIImage(systemName: "star.fill") else { return }
        let redStar = starImage.withTintColor(.red, renderingMode: .alwaysTemplate)
        let imageAttachment = NSTextAttachment(image: redStar)
        
        // 별점
        let ratingText = NSMutableAttributedString()
            .setting(string: "\(rating)  ",
                     fontSize: Constants.Label.mapCardRatingFontSize,
                     weight: .regular,
                     color: .label)
        
        //후기 갯수
        let reviewCountTest = NSMutableAttributedString()
            .setting(string: "후기 (\(reviewCount)개)",
                     fontSize: Constants.Label.mapCardReviewCountFontSize,
                     weight: .light,
                     color: .secondaryLabel)
        
        labelText.append(NSAttributedString(attachment:imageAttachment))
        labelText.append(ratingText)
        labelText.append(reviewCountTest)
        
        self.reviewLabel.attributedText = labelText
    }
    
    func setImage(image: UIImage) {
        self.imageView.image = image
    }
    
    private func addViews() {
        self.addSubview(imageView)
        self.addSubview(reviewLabel)
        self.addSubview(heartButton)
    }
    
    private func setUp() {
        
        self.imageView.snp.makeConstraints {
            $0.height.width.equalTo(Constants.CellSize.mapCardHeight)
            $0.leading.height.bottom.equalToSuperview()
        }
        
        self.reviewLabel.snp.makeConstraints {
            $0.leading.equalTo(self.imageView.snp.trailing).offset(8.0)
            $0.top.equalTo(self.snp.top).inset(8.0)
        }
        
        self.heartButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
        }
    }

    
    
    // TODO: 하트 버튼 이벤트
    private func configureHeartButtonTapped() {
        let image = UIImage(systemName: "heart")
        let highlightedImage = UIImage(systemName: "heart.fill")
        
        //버튼 터치시 변화를 보여주기 위해 선언함.
        self.heartButton.configurationUpdateHandler = { button in
            var configuration = button.configuration
            configuration?.image = button.isHighlighted ? highlightedImage : image
            button.configuration = configuration
        }
    }
}
