//
//  SearchResultCellView.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/24.
//

import UIKit

final class SearchResultCellView: UICollectionViewCell {
    static let identifier = "SearchResultCellView"
    
    let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_mapIcon")
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    let addressName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .grey1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(icon)
        addSubview(addressName)
        
        icon.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
            $0.width.equalTo(icon.snp.height)
        }
        
        addressName.snp.makeConstraints {
            $0.leading.equalTo(icon.snp.trailing).offset(16)
            $0.centerY.equalToSuperview()
        }
    }
    
    func setAddress(_ address: String) {
        addressName.text = address
    }
}
