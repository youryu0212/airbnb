//
//  RecommendCell.swift
//  Airbnb_iOS
//
//  Created by 김한솔 on 2022/05/24.
//

import UIKit

final class RecommendCell: UICollectionViewCell {
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0) // Gray1
        label.font = .systemFont(ofSize: 17, weight: .init(rawValue: 600))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let distanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init(red: 130/255, green: 130/255, blue: 130/255, alpha: 1.0) // Gray3
        label.font = .systemFont(ofSize: 17, weight: .init(rawValue: 400))
        label.translatesAutoresizingMaskIntoConstraints = false
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
        addSubViews([imageView, titleLabel, distanceLabel])

        NSLayoutConstraint.activate([
//            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 74)
        ])

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor),
            titleLabel.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1/2)
        ])
        
        NSLayoutConstraint.activate([
            distanceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            distanceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            distanceLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            distanceLabel.heightAnchor.constraint(equalTo: titleLabel.heightAnchor)
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        configure(image: nil, title: nil, distance: nil)
    }

    func configure(image: UIImage?, title: String?, distance: String?) {
        imageView.image = image
        titleLabel.text = title
        distanceLabel.text = distance
    }
}

private extension UIView {
    func addSubViews(_ subViews: [UIView]) {
        subViews.forEach {
            self.addSubview($0)
        }
    }
}
