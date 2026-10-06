//
//  MealDetailViewModel.swift
//  confuse_test_swift
//

import Foundation

final class MealDetailViewModel {

    let mealID: String
    let summary: MealSummary?

    private(set) var detail: MealDetail?
    private(set) var isLoading = false

    var onChange: (() -> Void)?
    var onError: ((String) -> Void)?

    init(mealID: String, summary: MealSummary?) {
        self.mealID = mealID
        self.summary = summary
    }

    func load() {
        isLoading = true
        onChange?()
        APIClient.shared.request(.detail(id: mealID)) { [weak self] (result: Result<MealDetailResponse, APIError>) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let response):
                self.detail = response.meals?.first
                self.onChange?()
            case .failure(let error):
                self.onError?(String(describing: error))
            }
        }
    }

    var title: String {
        return detail?.name ?? summary?.name ?? ""
    }

    var thumbnailURL: String? {
        return detail?.thumbnailURL ?? summary?.thumbnailURL
    }

    var metaText: String {
        guard let detail = detail else { return "" }
        var parts: [String] = []
        if !detail.area.isEmpty {
            parts.append(detail.area)
        }
        if !detail.category.isEmpty {
            parts.append(detail.category)
        }
        return parts.joined(separator: " · ")
    }

    var ingredients: [Ingredient] {
        return detail?.ingredients ?? []
    }

    var instructions: String {
        return detail?.instructions ?? ""
    }

    // Tags parsed from `strTags` — surfaced under the title in the header.
    var tags: [String] {
        return detail?.tags ?? []
    }

    /// A friendly, localized-list rendering of the tags. Reuses the shared
    /// top-level `ListFormatter` (`sharedListFormatter`).
    var tagsText: String {
        if tags.isEmpty {
            return ""
        }
        return sharedListFormatter.string(from: tags) ?? tags.joined(separator: ", ")
    }

    // Video link parsed from `strYoutube`; nil when the meal has no video.
    var youtubeURL: URL? {
        guard let raw = detail?.youtubeURL, !raw.isEmpty else {
            return nil
        }
        return URL(string: raw)
    }

    var hasVideo: Bool {
        return youtubeURL != nil
    }

    /// Plain-text recipe assembled for the system share sheet.
    var shareText: String {
        var blocks: [String] = [title]
        if !metaText.isEmpty {
            blocks.append(metaText)
        }
        let lines = ingredients.map { $0.displayText }
        if !lines.isEmpty {
            blocks.append(L("share.ingredients") + "\n" + lines.joined(separator: "\n"))
        }
        if let url = youtubeURL {
            blocks.append(url.absoluteString)
        }
        return blocks.joined(separator: "\n\n")
    }

    var isFavorite: Bool {
        return FavoritesStore.shared.isFavorite(mealID)
    }

    func toggleFavorite() {
        let candidate: MealSummary?
        if let summary = summary {
            candidate = summary
        } else if let detail = detail {
            candidate = MealSummary(id: detail.id, name: detail.name, thumbnailURL: detail.thumbnailURL)
        } else {
            candidate = nil
        }
        guard let meal = candidate else { return }
        FavoritesStore.shared.toggle(meal)
    }
}
