//
//  CategoriesViewModel.swift
//  confuse_test_swift
//

import Foundation

final class CategoriesViewModel {

    private(set) var categories: [MealCategory] = []
    private(set) var isLoading = false

    var onChange: (() -> Void)?
    var onError: ((String) -> Void)?

    func load() {
        if isLoading {
            return
        }
        isLoading = true

        APIClient.shared.request(.categories) { [weak self] (result: Result<CategoriesResponse, APIError>) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let response):
                self.categories = response.categories
                self.onChange?()
            case .failure(let error):
                self.onError?(String(describing: error))
            }
        }
    }

    func numberOfItems() -> Int {
        return categories.count
    }

    func category(at index: Int) -> MealCategory? {
        guard index >= 0 && index < categories.count else {
            return nil
        }
        return categories[index]
    }
}
