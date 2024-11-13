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
        case cardv0       = "/v3/c5de61fd-ff89-4c0a-8fdc-443ad9a94925"
    }
    
        init(_ baseUrl: String) {
            url = baseUrl
        }
}
