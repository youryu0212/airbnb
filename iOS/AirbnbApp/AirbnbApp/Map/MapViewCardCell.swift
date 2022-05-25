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
        guard let starImage = UIImage(systemName: "star.fill") else { return UILabel() }
        let redStar = starImage.withTintColor(.red, renderingMode: .alwaysTemplate)
        
        let imageAttachment = NSTextAttachment(image: redStar)
        
        let attributedString = NSMutableAttributedString(string: "")
        attributedString.append(NSAttributedString(attachment:imageAttachment))
        
        let label = UILabel()
        label.attributedText = attributedString
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setUp()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Text별 색상과 속성을 다르게 줌.
    func setReviewLabel(rating: Double, reviewCount: Int) {
        let labelText = NSMutableAttributedString()
        
        let ratingText = NSMutableAttributedString()
            .setting(string: "\(rating)",
                     fontSize: Constants.Label.mapCardRatingFontSize,
                     weight: .regular,
                     color:
                    .blue)
        
        let reviewCountTest = NSMutableAttributedString()
            .setting(string: "\(reviewCount)",
                     fontSize: Constants.Label.mapCardReviewCountFontSize,
                     weight: .light,
                     color: .secondaryLabel)
        
        labelText.append(ratingText)
        labelText.append(reviewCountTest)
        
        self.reviewLabel.attributedText = labelText
    }
    
    
    private func addViews() {
        self.addSubview(imageView)
        self.addSubview(reviewLabel)
    }
    
    private func setUp() {
        guard let mockImage = UIImage(systemName: "house") else { return }
        self.imageView.image = mockImage
        
        
        self.imageView.snp.makeConstraints {
            $0.height.width.equalTo(120)
            $0.leading.height.bottom.equalToSuperview()
        }
        
        self.reviewLabel.snp.makeConstraints {
            $0.leading.equalTo(self.imageView.snp.trailing).offset(8.0)
            $0.top.equalTo(self.snp.top).inset(8.0)
        }
        
    }
    
}
