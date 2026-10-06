//
//  MealDetail.swift
//  confuse_test_swift
//

import Foundation

struct MealDetailResponse: Decodable {
    let meals: [MealDetail]?
}

/// Full model returned by the lookup endpoint. TheMealDB flattens ingredients
/// into `strIngredient1...20` + `strMeasure1...20`; we fold those into a clean
/// `[Ingredient]` and drop the empty / "None" slots.
struct MealDetail: Equatable {
    let id: String
    let name: String
    let category: String
    let area: String
    let instructions: String
    let thumbnailURL: String
    let youtubeURL: String?
    let tags: [String]
    let ingredients: [Ingredient]
}

extension MealDetail: Decodable {

    private struct DynamicKey: CodingKey {
        var stringValue: String
        var intValue: Int? { return nil }
        init?(stringValue: String) { self.stringValue = stringValue }
        init?(intValue: Int) { return nil }
        init(_ key: String) { self.stringValue = key }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicKey.self)

        func string(_ key: String) -> String {
            guard let codingKey = DynamicKey(stringValue: key),
                  let value = try? container.decodeIfPresent(String.self, forKey: codingKey) else {
                return ""
            }
            return value ?? ""
        }

        id = string("idMeal")
        name = string("strMeal")
        category = string("strCategory")
        area = string("strArea")
        instructions = string("strInstructions")
        thumbnailURL = string("strMealThumb")

        let youtube = string("strYoutube").trimmingCharacters(in: .whitespaces)
        youtubeURL = youtube.isEmpty ? nil : youtube

        let rawTags = string("strTags")
        tags = rawTags
            .split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty }

        var collected: [Ingredient] = []
        for index in 1...20 {
            let name = string("strIngredient\(index)").trimmingCharacters(in: .whitespacesAndNewlines)
            let measure = string("strMeasure\(index)").trimmingCharacters(in: .whitespacesAndNewlines)
            let lowered = name.lowercased()
            if name.isEmpty || lowered == "none" {
                continue
            }
            collected.append(Ingredient(name: name, measure: measure))
        }
        ingredients = collected
    }
}
