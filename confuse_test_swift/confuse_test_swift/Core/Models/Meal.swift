//
//  Meal.swift
//  confuse_test_swift
//

import Foundation

struct MealsResponse: Decodable {
    let meals: [MealSummary]?
}

/// Lightweight model returned by the list / search endpoints. `Codable` so it
/// can also be persisted by the favorites store.
struct MealSummary: Codable, Equatable {
    let id: String
    let name: String
    let thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnailURL = "strMealThumb"
    }

    var previewThumbnailURL: String {
        // TheMealDB serves a small variant when the "/preview" suffix is used.
        return thumbnailURL + "/preview"
    }
}
