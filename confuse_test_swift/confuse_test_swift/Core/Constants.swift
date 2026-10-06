//
//  Constants.swift
//  confuse_test_swift
//
//  Top-level constants — real app-wide configuration.
//  (These file-level `let`/`var` also exercise the global-variable module.)
//

import Foundation

let apiBaseURL = "https://www.themealdb.com/api/json/v1/1"

let appDisplayName = "CookBook"

let searchMinimumLength = 2

var isVerboseLoggingEnabled = false

/// Lightweight `UserDefaults`-backed property wrapper — a common house
/// convention that also gives the property-wrapper construct a real home.
@propertyWrapper
struct UserDefaultBacked<Value> {
    let key: String
    let defaultValue: Value
    var storage: UserDefaults = .standard

    var wrappedValue: Value {
        get { return storage.object(forKey: key) as? Value ?? defaultValue }
        set { storage.set(newValue, forKey: key) }
    }
}

/// App-wide user preferences, persisted through `@UserDefaultBacked`.
enum Preferences {

    @UserDefaultBacked(key: "pref.sortOrderRaw", defaultValue: "relevance")
    static var sortOrderRaw: String

    @UserDefaultBacked(key: "pref.favoritesOnly", defaultValue: false)
    static var favoritesOnly: Bool

    static var sortOrder: MealSortOrder {
        get { return MealSortOrder(rawValue: sortOrderRaw) ?? .relevance }
        set { sortOrderRaw = newValue.rawValue }
    }
}
