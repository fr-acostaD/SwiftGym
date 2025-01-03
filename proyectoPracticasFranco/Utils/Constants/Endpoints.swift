//
//  Endpoints.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 12/11/24.
//


struct EndPoints{

    static let endpointCardV1: Endpoint = {
        
        let baseURL = Constants.API.mockApiURL

        return Endpoint(
            baseURL: baseURL,
            path: MockApiURL.path.cardv1.rawValue,
            queryItems: [
//                QueryParameters.pagination(page: 1, limit: 20),
//                QueryParameters.search(query: "swift"),
//                QueryParameters.filters(category: "books", sortBy: "price"),
            ],
            httpMethod: .get
        )
    }()
    
    static let endpointCardV2: Endpoint = {
        
        let baseURL = Constants.API.mockApiURL

        return Endpoint(
            baseURL: baseURL,
            path: MockApiURL.path.cardv2.rawValue,
            queryItems: [
//                QueryParameters.pagination(page: 1, limit: 20),
//                QueryParameters.search(query: "swift"),
//                QueryParameters.filters(category: "books", sortBy: "price"),
            ],
            httpMethod: .get
        )
    }()
    
    static let endpointCardV0: Endpoint = {
        
        let baseURL = Constants.API.mockApiURL

        return Endpoint(
            baseURL: baseURL,
            path: MockApiURL.path.cardv0_1.rawValue,
            queryItems: [
//                QueryParameters.pagination(page: 1, limit: 20),
//                QueryParameters.search(query: "swift"),
//                QueryParameters.filters(category: "books", sortBy: "price"),
            ],
            httpMethod: .get
        )
    }()

}
