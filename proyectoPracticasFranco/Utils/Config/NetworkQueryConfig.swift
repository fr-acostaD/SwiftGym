//
//  QueryParametersConfig.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 11/11/24.
//

// Esto es para poner de manera personalizada la manera que se pone los queries en la url con sus simbolos.
// Luego en la interfaz del endpoint solo hay que poner los valores corespondientes que se van a aplicar.
// Asi es que aqui se configura el modelo preestableciendo todo los simbolos segun cada API_URL de manera totalmente personalizada
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
