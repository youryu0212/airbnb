//
//  SearchOneInARowCollectionViewCell.swift
//  Airbnb
//
//  Created by 백상휘 on 2022/05/24.
//

import UIKit

class SearchOneInARowCollectionViewCell: SearchCellCommonType {
    
    private var mainImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override func setData(model: SearchViewModel) {
        mainImageView.image = UIImage(data: model.imageData)
        titleLabel.text = model.titleLabel
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(mainImageView)
        contentView.addSubview(titleLabel)
        
        mainImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.greaterThanOrEqualTo(22)
        }
        
        mainImageView.snp.makeConstraints { make in
            make.bottom.equalTo(titleLabel.snp.top)
        }
        
        mainImageView.backgroundColor = .white
        
        contentView.backgroundColor = UIColor.init(displayP3Red: CGFloat.random(in: 0.0...1.0), green: CGFloat.random(in: 0.0...1.0), blue: CGFloat.random(in: 0.0...1.0), alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
