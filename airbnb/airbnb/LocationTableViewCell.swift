import UIKit

class LocationTableViewCell: UITableViewCell {

    static let identifier: String = "locationTableViewCell"

    private lazy var spotStackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [self.spotImageView, self.locationStackView])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    }()

    private lazy var spotImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(systemName: "map")
        return imageView
    }()

    private lazy var locationStackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [self.titleLabel, self.distanceLabel])
        stackView.axis = .vertical
        return stackView
    }()

    private var titleLabel: UILabel = {
        var label = UILabel()
        return label
    }()

    private var distanceLabel: UILabel = {
        var label = UILabel()
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

    private func setUI() {
        self.addSubview(spotStackView)
    }

    private func setConstraints() {
        configureSpotStackViewContraint()
    }

    private func configureSpotStackViewContraint() {
        spotStackView.translatesAutoresizingMaskIntoConstraints = false
        spotImageView.translatesAutoresizingMaskIntoConstraints = false
        locationStackView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            spotImageView.topAnchor.constraint(equalTo: spotStackView.topAnchor),
            spotImageView.leadingAnchor.constraint(equalTo: spotStackView.leadingAnchor),
            spotImageView.bottomAnchor.constraint(equalTo: spotStackView.bottomAnchor),
            spotImageView.widthAnchor.constraint(equalTo: spotStackView.heightAnchor),

            distanceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4)
        ])

    }

    func setTitle(_ text: String) {
        titleLabel.text = text
    }

    func setDistance(_ text: String) {
        distanceLabel.text = text
    }
}
