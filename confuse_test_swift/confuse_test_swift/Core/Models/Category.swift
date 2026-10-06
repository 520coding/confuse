//
//  Category.swift
//  confuse_test_swift
//

import Foundation

struct CategoriesResponse: Decodable {
    let categories: [MealCategory]
}

struct MealCategory: Decodable, Equatable {
    let id: String
    let name: String
    let thumbnailURL: String
    let info: String

    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case thumbnailURL = "strCategoryThumb"
        case info = "strCategoryDescription"
    }

    var shortInfo: String {
        let trimmed = info.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed.count <= 120 {
            return trimmed
        }
        let end = trimmed.index(trimmed.startIndex, offsetBy: 120)
        return String(trimmed[..<end]) + "…"
    }
}
