//
//  Endpoint.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 11/11/24.
//

import Foundation



//let baseURL = Constants.API.gptBaseURL
//
//let endpoint = Endpoint(
//    baseURL: baseURL.url,
//    path: GptBaseURL.paths.posts.rawValue,
//    queryItems: [
//        QueryParameters.pagination(page: 1, limit: 20),
//        QueryParameters.search(query: "swift"),
//        QueryParameters.filters(category: "books", sortBy: "price"),
//                 ],
//    httpMethod: .get
//)




struct Endpoint {
    let baseURL: String
    let path: String
    let queryItems: [QueryParameters]
    let httpMethod: Constants.HTTP.Method
    let body: Data?
    
    init(baseURL: String, path: String, queryItems: [QueryParameters] = [], httpMethod: Constants.HTTP.Method, body: Data? = nil) {
        self.baseURL = baseURL
        self.path = path
        self.queryItems = queryItems
        self.httpMethod = httpMethod
        self.body = body
    }
    
    var request: URLRequest? {
        var components = URLComponents()
        components.scheme = Constants.Scheme.https
        components.host = baseURL
        components.path = path
        
        // Resuelve y aplica todos los queryItems
        components.queryItems = queryItems.flatMap { $0.resolve(baseURL: baseURL) }
        
        guard let url = components.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body
        return request
    }
}
