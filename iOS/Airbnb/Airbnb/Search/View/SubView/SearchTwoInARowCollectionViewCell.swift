//
//  SearchTwoInARowCollectionViewCell.swift
//  Airbnb
//
//  Created by 백상휘 on 2022/05/24.
//

import UIKit

class SearchTwoInARowCollectionViewCell: UICollectionViewCell, SearchCellCommonType {
    
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
    
    private var mainView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var mainImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var subTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    func setData(model: SearchFavoriteLocationModel) {
        mainImageView.image = UIImage(data: model.imageData)
        titleLabel.text = model.titleLabel
        subTitleLabel.text = model.subTitleLabel
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(mainView)
        
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mainView.layer.cornerRadius = 8
        
        mainView.addSubview(mainImageView)
        
        mainImageView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().offset(8)
            make.width.equalTo(60)
        }
        
        mainImageView.addSubview(titleLabel)
        mainImageView.addSubview(subTitleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().offset(8)
            make.leading.equalTo(mainImageView).offset(8)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview().offset(8)
            make.leading.equalTo(mainImageView).offset(8)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(subTitleLabel).offset(8)
        }
        
        contentView.backgroundColor = UIColor.init(displayP3Red: CGFloat.random(in: 0.0...1.0), green: CGFloat.random(in: 0.0...1.0), blue: CGFloat.random(in: 0.0...1.0), alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
