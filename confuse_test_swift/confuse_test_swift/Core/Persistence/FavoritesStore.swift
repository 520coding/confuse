//
//  FavoritesStore.swift
//  confuse_test_swift
//

import Foundation

extension Notification.Name {
    static let favoritesDidChange = Notification.Name("favoritesDidChange")
}

/// Persists favorite meals in UserDefaults and broadcasts changes.
final class FavoritesStore {

    static let shared = FavoritesStore()

    private let defaults: UserDefaults
    private let storageKey = "favorites.meals.v1"

    private(set) var meals: [MealSummary]

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        if let data = defaults.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([MealSummary].self, from: data) {
            meals = decoded
        } else {
            meals = []
        }
    }

    func isFavorite(_ id: String) -> Bool {
        return meals.contains { $0.id == id }
    }

    func toggle(_ meal: MealSummary) {
        if let index = meals.firstIndex(where: { $0.id == meal.id }) {
            meals.remove(at: index)
        } else {
            meals.insert(meal, at: 0)
        }
        persist()
    }

    private func persist() {
        if let data = try? JSONEncoder().encode(meals) {
            defaults.set(data, forKey: storageKey)
        }
        NotificationCenter.default.post(name: .favoritesDidChange, object: self)
    }
}
