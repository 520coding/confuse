//
//  Localized.swift
//  confuse_test_swift
//
//  Thin localization helper. `L` is a top-level function — a common house
//  convention — which also exercises the global-function module.
//

import Foundation

func L(_ key: String) -> String {
    return NSLocalizedString(key, comment: "")
}

func L(_ key: String, _ arguments: CVarArg...) -> String {
    let format = NSLocalizedString(key, comment: "")
    return String(format: format, arguments: arguments)
}
