//
//  LocationResultViewCell.swift
//  airbnb
//
//  Created by Bibi on 2022/05/26.
//

import UIKit

class LocationResultViewCell: UITableViewCell {

    static let identifier: String = "LocationResultViewCell"

    private lazy var spotStackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [self.spotImageView, self.locationView])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()

    private lazy var spotImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(systemName: "mappin.square.fill")
        imageView.backgroundColor = .systemGray6
        imageView.tintColor = .systemGray3
        imageView.layer.borderColor = CGColor(gray: 0.7, alpha: 1)
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 10
        return imageView
    }()

    private lazy var locationView: UIView = {
        var view = UIView()
        view.addSubview(self.locationStackView)
        return view
    }()

    private lazy var locationStackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [self.titleLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()

    private var titleLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
        setConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
    }

    private func setUI() {
        // self.addSubview(spotStackView)
        contentView.addSubview(spotStackView)
    }

    private func setConstraints() {
        configureSpotStackViewContraint()
    }

    private func configureSpotStackViewContraint() {
        spotStackView.translatesAutoresizingMaskIntoConstraints = false
        spotImageView.translatesAutoresizingMaskIntoConstraints = false
        locationStackView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            spotStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            spotStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            spotStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            spotStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),

            spotImageView.topAnchor.constraint(equalTo: spotStackView.topAnchor),
            spotImageView.leadingAnchor.constraint(equalTo: spotStackView.leadingAnchor),
            spotImageView.bottomAnchor.constraint(equalTo: spotStackView.bottomAnchor),
            spotImageView.heightAnchor.constraint(equalToConstant: 64),
            spotImageView.widthAnchor.constraint(equalTo: spotStackView.heightAnchor),

            locationView.topAnchor.constraint(equalTo: spotStackView.topAnchor),
            locationView.bottomAnchor.constraint(equalTo: spotStackView.bottomAnchor),

            locationStackView.centerYAnchor.constraint(equalTo: locationView.centerYAnchor)
        ])

    }

    func setTitle(_ text: String) {
        titleLabel.text = text
    }
}
