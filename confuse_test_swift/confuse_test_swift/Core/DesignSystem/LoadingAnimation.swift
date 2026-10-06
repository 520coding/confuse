//
//  LoadingAnimation.swift
//  confuse_test_swift
//
//  Bundled loading-animation payload (a Lottie JSON). Keeping the JSON + this
//  name reference lets the lottie module rewrite the resource without linking a
//  heavy animation library.
//

import Foundation

enum LoadingAnimation {

    static let resourceName = "animation"

    static func spinnerData() -> Data? {
        guard let url = Bundle.main.url(forResource: resourceName, withExtension: "json") else {
            return nil
        }
        return try? Data(contentsOf: url)
    }
}
