//
//  UIImageView+Remote.swift
//  confuse_test_swift
//

import UIKit

private var loadTokenKey: UInt8 = 0

extension UIImageView {

    private var currentLoadToken: UUID? {
        get { objc_getAssociatedObject(self, &loadTokenKey) as? UUID }
        set { objc_setAssociatedObject(self, &loadTokenKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    /// Loads a remote image, showing a placeholder until it arrives. Cancels any
    /// in-flight load for reused cells.
    func setRemoteImage(_ urlString: String?, placeholder: UIImage? = UIImage(named: "placeholder")) {
        ImageLoader.shared.cancel(currentLoadToken)
        image = placeholder

        guard let urlString = urlString, let url = URL(string: urlString) else {
            return
        }

        if let cached = ImageLoader.shared.cachedImage(for: url) {
            image = cached
            return
        }

        currentLoadToken = ImageLoader.shared.load(url) { [weak self] loaded in
            guard let self = self, let loaded = loaded else { return }
            self.image = loaded
        }
    }
}
