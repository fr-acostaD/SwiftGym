//
//  QueryParametersConfig.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 11/11/24.
//


struct QueryParametersConfig {
    static let parameterNames: [String: ParameterKeys] = [
        Constants.API.productionBaseURL: ParameterKeys(
            pagination: ["page": "page", "limit": "limit"],
            search: "q",
            filters: ["category": "category", "sortBy": "sortBy"]
        ),
        Constants.API.developmentBaseURL: ParameterKeys(
            pagination: ["page": "start", "limit": "count"],
            search: "keyword",
            filters: ["category": "filter_category", "sortBy": "order_by"]
        )
    ]
}

struct ParameterKeys {
    let pagination: [String: String] // e.g., ["page": "page", "limit": "limit"]
    let search: String               // e.g., "q"
    let filters: [String: String]    // e.g., ["category": "category", "sortBy": "sortBy"]
}
