//
//  MockApiURL.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 12/11/24.
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
        case cardv0       = "/v3/0df466e4-7105-4905-a044-caaf741ab2dd"
        case cardv0_1     = "/v3/a0c7e00d-e9c4-4899-9070-3817cfb7ce40"
        case cardv1       = "/v3/3cecb6b2-ac5e-4489-9069-2cf4443dc5d0"
        case cardv2       = "/v3/59276227-f455-42fa-9a74-b43d428778de"
    }
    
        init(_ baseUrl: String) {
            url = baseUrl
        }
}
