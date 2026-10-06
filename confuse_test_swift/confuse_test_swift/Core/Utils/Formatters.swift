//
//  Formatters.swift
//  confuse_test_swift
//
//  Top-level helpers shared across the app. `ingredientSummary` is a free
//  function and `sharedListFormatter` a global `let` — both exercise the global
//  function / global variable modules while reading like ordinary utilities.
//

import Foundation

let sharedListFormatter: ListFormatter = {
    let formatter = ListFormatter()
    return formatter
}()

func ingredientSummary(_ ingredients: [Ingredient], limit: Int = 3) -> String {
    let names = ingredients.prefix(limit).map { $0.name }
    if names.isEmpty {
        return ""
    }
    return sharedListFormatter.string(from: names) ?? names.joined(separator: ", ")
}

func clamp(_ value: Int, lower: Int, upper: Int) -> Int {
    return min(max(value, lower), upper)
}
