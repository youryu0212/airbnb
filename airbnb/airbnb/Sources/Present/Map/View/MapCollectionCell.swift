//
//  MapCollectionCell.swift
//  airbnb
//
//  Created by 김동준 on 2022/05/23.
//

import SnapKit

final class MapCollectionCell: UICollectionViewCell {
    
    static let identifier = "MapCollectionCell"
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.backgroundColor = UIColor.blue.cgColor
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI(){
        contentView.addSubview(imageView)
        contentView.backgroundColor = .white
        
        imageView.snp.makeConstraints { make in
            make.top.leading.bottom.equalTo(contentView)
            make.width.height.equalTo(120)
        }
    }
}
