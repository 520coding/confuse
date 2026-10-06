//
//  MealListViewModel.swift
//  confuse_test_swift
//

import Foundation

/// Ordering applied to the meal list. `String`-backed so it can persist through
/// `Preferences` (@UserDefaultBacked) across launches.
enum MealSortOrder: String, CaseIterable {
    case relevance
    case nameAsc
    case nameDesc

    var title: String {
        switch self {
        case .relevance:
            return L("sort.relevance")
        case .nameAsc:
            return L("sort.nameAsc")
        case .nameDesc:
            return L("sort.nameDesc")
        }
    }
}

final class MealListViewModel {

    let category: String

    private(set) var meals: [MealSummary] = []
    private(set) var isLoading = false

    var onChange: (() -> Void)?
    var onError: ((String) -> Void)?

    private var searchWorkItem: DispatchWorkItem?

    init(category: String) {
        self.category = category
    }

    // MARK: Preferences-backed display options

    var sortOrder: MealSortOrder {
        get { return Preferences.sortOrder }
        set { Preferences.sortOrder = newValue }
    }

    var favoritesOnly: Bool {
        get { return Preferences.favoritesOnly }
        set { Preferences.favoritesOnly = newValue }
    }

    func setSortOrder(_ order: MealSortOrder) {
        sortOrder = order
        onChange?()
    }

    func toggleFavoritesOnly() {
        favoritesOnly.toggle()
        onChange?()
    }

    /// The list actually shown: raw results after the favorites filter + sort.
    var displayed: [MealSummary] {
        var result = meals
        if favoritesOnly {
            result = result.filter { FavoritesStore.shared.isFavorite($0.id) }
        }
        switch sortOrder {
        case .relevance:
            break
        case .nameAsc:
            result.sort { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending }
        case .nameDesc:
            result.sort { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedDescending }
        }
        return result
    }

    // MARK: Loading

    func loadCategory() {
        isLoading = true
        onChange?()
        APIClient.shared.request(.meals(category: category)) { [weak self] (result: Result<MealsResponse, APIError>) in
            guard let self = self else { return }
            self.handle(result)
        }
    }

    func search(_ query: String) {
        searchWorkItem?.cancel()
        let trimmed = query.trimmingCharacters(in: .whitespacesAndNewlines)

        if !shouldSearch(trimmed) {
            loadCategory()
            return
        }

        let work = DispatchWorkItem { [weak self] in
            self?.performSearch(trimmed)
        }
        searchWorkItem = work
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: work)
    }

    private func performSearch(_ query: String) {
        isLoading = true
        onChange?()
        APIClient.shared.request(.search(query: query)) { [weak self] (result: Result<MealsResponse, APIError>) in
            guard let self = self else { return }
            self.handle(result)
        }
    }

    private func handle(_ result: Result<MealsResponse, APIError>) {
        isLoading = false
        switch result {
        case .success(let response):
            meals = response.meals ?? []
            onChange?()
        case .failure(let error):
            meals = []
            onError?(String(describing: error))
        }
    }

    // Plain `if` + `&&` / `||` — natural coverage for the condition module.
    func shouldSearch(_ query: String) -> Bool {
        if query.count >= searchMinimumLength && !query.isEmpty {
            return true
        }
        return false
    }

    var isEmptyState: Bool {
        if displayed.isEmpty && !isLoading {
            return true
        }
        return false
    }

    func numberOfItems() -> Int {
        return displayed.count
    }

    func meal(at index: Int) -> MealSummary? {
        let items = displayed
        guard index >= 0 && index < items.count else {
            return nil
        }
        return items[index]
    }
}
