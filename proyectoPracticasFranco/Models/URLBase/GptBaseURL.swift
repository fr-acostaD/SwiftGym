//
//  GptBaseURL.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 11/11/24.
//



struct GptBaseURL: BaseURL {
    let url: String
    let headers: [String : String] =
    [
        "Authorization": "Bearer token",
        "X-Api-Key": "application/json",
        "Content-Type" : "application/json",
    ]
    
//    Cambiar a un enum
    enum path: String {
        case post       = "/posts"
        case user       = "/users"
        case comments   = "/comments"
    }
    
        init(_ baseUrl: String) {
            url = baseUrl
        }
}
