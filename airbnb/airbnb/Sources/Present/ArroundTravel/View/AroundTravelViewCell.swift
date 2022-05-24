//
//  HomeTravelViewCell.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/23.
//

import RxSwift
import UIKit

final class AroundTravelViewCell: UICollectionViewCell {
    static var identifier: String { .init(describing: self) }
    
    let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    let travalName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .grey1
        return label
    }()
    
    let distance: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .grey3
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    @Inject(\.imageManager) private var imageManager: ImageManager
    private let disposeBag = DisposeBag()

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(icon)
        addSubview(travalName)
        addSubview(distance)
        
        icon.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
            $0.width.equalTo(icon.snp.height)
        }
        
        travalName.snp.makeConstraints {
            $0.bottom.equalTo(snp.centerY).inset(2)
            $0.leading.equalTo(icon.snp.trailing).offset(16)
        }
        
        distance.snp.makeConstraints {
            $0.top.equalTo(snp.centerY).offset(2)
            $0.leading.equalTo(icon.snp.trailing).offset(16)
        }
    }
    
    func setTraval(_ traval: AroundTraval) {
        imageManager.loadImage(url: traval.imageUrl).asObservable()
            .withUnretained(self)
            .observe(on: MainScheduler.asyncInstance)
            .bind(onNext: { cell, image in
                cell.icon.image = image
            })
            .disposed(by: disposeBag)
        
        travalName.text = traval.name
        distance.text = traval.distance
    }
}
