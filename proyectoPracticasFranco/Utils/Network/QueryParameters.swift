//
//  QueryParameters.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 11/11/24.
//

import Foundation


enum QueryParameters {
    case pagination(page: Int, limit: Int)
    case search(query: String)
    case filters(category: String?, sortBy: String?)
}


extension QueryParameters {
    func resolve(baseURL: String) -> [URLQueryItem] {
        switch self {
        case .pagination(let page, let limit):
            guard let keys = QueryParametersConfig.parameterNames[baseURL]?.pagination else {
                return []
            }
            return [
                URLQueryItem(name: keys["page"] ?? "page", value: "\(page)"),
                URLQueryItem(name: keys["limit"] ?? "limit", value: "\(limit)")
            ]
            
        case .search(let query):
            guard let key = QueryParametersConfig.parameterNames[baseURL]?.search else {
                return []
            }
            return [URLQueryItem(name: key, value: query)]
            
        case .filters(let category, let sortBy):
            guard let keys = QueryParametersConfig.parameterNames[baseURL]?.filters else {
                return []
            }
            var items: [URLQueryItem] = []
            if let category = category {
                items.append(URLQueryItem(name: keys["category"] ?? "category", value: category))
            }
            if let sortBy = sortBy {
                items.append(URLQueryItem(name: keys["sortBy"] ?? "sortBy", value: sortBy))
            }
            return items
        }
    }
}
