//
//  MealHeaderView.swift
//  confuse_test_swift
//
//  Detail hero header laid out with SnapKit.
//

import SnapKit
import UIKit

final class MealHeaderView: UIView {

    static let preferredHeight: CGFloat = 340

    private let heroImageView = UIImageView()
    private let nameLabel = UILabel()
    private let metaLabel = UILabel()
    private let tagsLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        heroImageView.contentMode = .scaleAspectFill
        heroImageView.clipsToBounds = true
        heroImageView.backgroundColor = UIColor(white: 0.92, alpha: 1.0)

        nameLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        nameLabel.numberOfLines = 0

        metaLabel.font = Theme.caption
        metaLabel.textColor = Theme.subtitle

        tagsLabel.font = Theme.caption
        tagsLabel.textColor = Theme.accent
        tagsLabel.numberOfLines = 0

        addSubview(heroImageView)
        addSubview(nameLabel)
        addSubview(metaLabel)
        addSubview(tagsLabel)
    }

    private func setupConstraints() {
        heroImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(200)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(heroImageView.snp.bottom).offset(12)
            make.left.right.equalToSuperview().inset(16)
        }
        metaLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(6)
            make.left.right.equalToSuperview().inset(16)
        }
        tagsLabel.snp.makeConstraints { make in
            make.top.equalTo(metaLabel.snp.bottom).offset(6)
            make.left.right.equalToSuperview().inset(16)
        }
    }

    func configure(name: String, meta: String, tags: String, thumbnailURL: String?) {
        nameLabel.text = name
        metaLabel.text = meta
        tagsLabel.text = tags
        tagsLabel.isHidden = tags.isEmpty
        heroImageView.setRemoteImage(thumbnailURL)
    }
}
