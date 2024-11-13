//
//  GptBaseURL 2.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 12/11/24.
//


struct BeeceptorURL: BaseURL {
    let url: String
    let headers: [String : String] = [ : ]
    
//    Cambiar a un enum
    enum path: String {
        case cardv0    = "/cardv0"
        case cardv1    = "/cardv1"
    }
    
        init(_ baseUrl: String) {
            url = baseUrl
        }
}
