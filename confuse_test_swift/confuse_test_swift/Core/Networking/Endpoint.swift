//
//  Endpoint.swift
//  confuse_test_swift
//
//  TheMealDB (free, no API key). https://www.themealdb.com/api.php
//

import Foundation

enum Endpoint {
    case categories
    case meals(category: String)
    case detail(id: String)
    case search(query: String)
    case random

    private var path: String {
        switch self {
        case .categories:
            return "/categories.php"
        case .meals:
            return "/filter.php"
        case .detail:
            return "/lookup.php"
        case .search:
            return "/search.php"
        case .random:
            return "/random.php"
        }
    }

    private var queryItems: [URLQueryItem] {
        switch self {
        case .categories, .random:
            return []
        case .meals(let category):
            return [URLQueryItem(name: "c", value: category)]
        case .detail(let id):
            return [URLQueryItem(name: "i", value: id)]
        case .search(let query):
            return [URLQueryItem(name: "s", value: query)]
        }
    }

    var url: URL? {
        var components = URLComponents(string: apiBaseURL + path)
        let items = queryItems
        if !items.isEmpty {
            components?.queryItems = items
        }
        return components?.url
    }
}
