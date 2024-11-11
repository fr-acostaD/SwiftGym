//
//  GptBaseURL.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 11/11/24.
//


struct GptBaseURL {
        let url: String
//    Cambiar a un enum
        let paths: [String : String] = [
            "posts" : "/posts",
            "users" : "/users",
            "comments" : "/comments",
        ]
    
        init(_ baseUrl: String) {
            url = baseUrl
        }
    }
