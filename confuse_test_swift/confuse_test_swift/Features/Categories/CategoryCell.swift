//
//  CategoryCell.swift
//  confuse_test_swift
//
//  xib-backed cell — the xib binds its custom class here (exercises the xib
//  module's customClass rename + image-reference rewrite).
//

import UIKit

class CategoryCell: UITableViewCell {

    static let reuseIdentifier = "CategoryCell"

    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailView.layer.cornerRadius = 8
        thumbnailView.clipsToBounds = true
        thumbnailView.contentMode = .scaleAspectFill
        nameLabel.font = Theme.title
        infoLabel.font = Theme.body
        infoLabel.textColor = Theme.subtitle
        infoLabel.numberOfLines = 2
    }

    func configure(with category: MealCategory) {
        nameLabel.text = category.name
        infoLabel.text = category.shortInfo
        thumbnailView.setRemoteImage(category.thumbnailURL)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailView.image = UIImage(named: "placeholder")
    }
}
