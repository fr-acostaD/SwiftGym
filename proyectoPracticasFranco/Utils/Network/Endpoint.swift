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
//    baseURL: baseURL,
//    path: GptBaseURL.paths.posts.rawValue,
//    queryItems: [
//        QueryParameters.pagination(page: 1, limit: 20),
//        QueryParameters.search(query: "swift"),
//        QueryParameters.filters(category: "books", sortBy: "price"),
//                 ],
//    httpMethod: .get
//)


struct Endpoint {
    let baseURL: BaseURL
    let path: String
    let queryItems: [QueryParameters]
    let httpMethod: Constants.HTTP.Method
    let body: Data?
    
    
    init(baseURL: BaseURL, path: String, queryItems: [QueryParameters] = [], httpMethod: Constants.HTTP.Method, body: Data? = nil) {
        self.baseURL = baseURL
        self.path = path
        self.queryItems = queryItems
        self.httpMethod = httpMethod
        self.body = body
    }
    
    var request: URLRequest? {
        
        var components = URLComponents()
        components.scheme = Constants.Scheme.https
        components.host = baseURL.url
        components.path = path


        // Resuelve y aplica todos los queryItems
        components.queryItems = queryItems.flatMap { $0.resolve(baseURL: baseURL.url) }
        
        guard let url = components.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body
        request.addHeaders(from: self)
        return request
    }
}

extension URLRequest {
    mutating func addHeaders(from endpoint: Endpoint) {
        
        for (key, value) in endpoint.baseURL.headers {
            self.setValue(value, forHTTPHeaderField: key)
        }

//        if endpoint.httpMethod == .post || endpoint.httpMethod == .put {
//            self.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        }
//        
//        if let authToken = endpoint.authToken {
//            self.setValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
//        }
//        
//        if let apiKey = endpoint.apiKey {
//            self.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
//        }
    }
}
