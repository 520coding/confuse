//
//  MealCell.swift
//  confuse_test_swift
//
//  Code-laid-out cell using SnapKit (exercises the layout / SnapKit module).
//

import SnapKit
import UIKit

class MealCell: UITableViewCell {

    static let reuseIdentifier = "MealCell"

    private let thumbnailView = UIImageView()
    private let nameLabel = UILabel()
    private let favoriteBadge = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        thumbnailView.contentMode = .scaleAspectFill
        thumbnailView.clipsToBounds = true
        thumbnailView.layer.cornerRadius = 8
        thumbnailView.backgroundColor = UIColor(white: 0.92, alpha: 1.0)

        nameLabel.font = Theme.title
        nameLabel.numberOfLines = 2

        favoriteBadge.contentMode = .scaleAspectFit
        favoriteBadge.tintColor = Theme.accent

        contentView.addSubview(thumbnailView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(favoriteBadge)
    }

    private func setupConstraints() {
        thumbnailView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(64)
        }
        favoriteBadge.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(22)
        }
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(thumbnailView.snp.right).offset(12)
            make.right.equalTo(favoriteBadge.snp.left).offset(-12)
            make.centerY.equalToSuperview()
        }
    }

    func configure(with meal: MealSummary) {
        nameLabel.text = meal.name
        thumbnailView.setRemoteImage(meal.thumbnailURL)

        let isFavorite = FavoritesStore.shared.isFavorite(meal.id)
        favoriteBadge.image = UIImage(named: isFavorite ? "icon_star_filled" : "icon_star")
        favoriteBadge.isHidden = !isFavorite
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailView.image = UIImage(named: "placeholder")
    }
}
