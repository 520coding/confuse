//
//  Theme.swift
//  confuse_test_swift
//

import UIKit

enum Theme {

    // Asset-catalog colors (exercises the colorset path).
    static let background = UIColor(named: "BackgroundColor") ?? .white
    static let accent = UIColor(named: "BrandColor") ?? .systemBlue

    // Programmatic colors (exercises the UIColor(...) init path).
    static let primary = UIColor(red: 0.16, green: 0.47, blue: 0.96, alpha: 1.0)
    static let subtitle = UIColor(white: 0.55, alpha: 1.0)

    // Fonts.
    static let title = UIFont.systemFont(ofSize: 17, weight: .semibold)
    static let body = UIFont.systemFont(ofSize: 15, weight: .regular)
    static let caption = UIFont(name: "Menlo", size: 13) ?? UIFont.monospacedSystemFont(ofSize: 13, weight: .regular)
}
