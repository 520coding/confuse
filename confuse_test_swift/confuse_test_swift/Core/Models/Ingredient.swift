//
//  Ingredient.swift
//  confuse_test_swift
//

import Foundation

struct Ingredient: Equatable {
    let name: String
    let measure: String

    var displayText: String {
        let measure = self.measure.trimmingCharacters(in: .whitespacesAndNewlines)
        if measure.isEmpty {
            return name
        }
        return "\(measure) \(name)"
    }
}
