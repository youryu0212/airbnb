//
//  LivingTravelCell.swift
//  Airbnb_iOS
//
//  Created by 김한솔 on 2022/05/24.
//

import UIKit

final class LivingTravelCell: UICollectionViewCell {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .init(red: 51/255, green: 51/255, blue: 51/255, alpha: 1) // Gray1
        label.font = .systemFont(ofSize: 17, weight: .init(600))
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setLayout() {
        contentView.addSubViews([imageView, titleLabel])

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 308)
        ])

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        configure(image: nil)
    }

    func configure(image: UIImage?) {
        imageView.image = image
    }
}

private extension UIView {
    func addSubViews(_ subViews: [UIView]) {
        subViews.forEach {
            self.addSubview($0)
        }
    }
}
