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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        self.addSubview(imageView)
        
        guard let mockImage = UIImage(systemName: "house") else { return }
        self.imageView.image = mockImage
        
        self.imageView.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
        }
    }
    
}
