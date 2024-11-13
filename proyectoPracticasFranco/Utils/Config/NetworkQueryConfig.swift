//
//  QueryParametersConfig.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 11/11/24.
//


struct QueryParametersConfig {
    static let parameterNames: [String: ParameterKeys] = [:]
//    [
//        Constants.API.gptBaseURL: ParameterKeys(
//            pagination: ["page": "page", "limit": "limit"],
//            search: "q",
//            filters: ["category": "category", "sortBy": "sortBy"]
//        ),
//        Constants.API.devBaseURL: ParameterKeys(
//            pagination: ["page": "start", "limit": "count"],
//            search: "keyword",
//            filters: ["category": "filter_category", "sortBy": "order_by"]
//        )
//    ]
}

struct ParameterKeys {
    let pagination: [String: String]
    let search: String
    let filters: [String: String]    
}
