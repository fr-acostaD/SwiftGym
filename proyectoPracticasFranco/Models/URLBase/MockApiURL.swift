//
//  GptBaseURL 2.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 12/11/24.
//


//
//  GptBaseURL.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 11/11/24.
//



struct MockApiURL: BaseURL {
    let url: String
    let headers: [String : String] =
    [
        "Authorization": "Bearer token",
        "X-Api-Key": "application/json",
        "Content-Type" : "application/json",
    ]
    
//    Cambiar a un enum
    enum path: String {
        case cardv0       = "/cardv0"
    }
    
        init(_ baseUrl: String) {
            url = baseUrl
        }
}
