//
//  Constants.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 11/11/24.
//


struct Constants {
    
    static let sizeWidth: Double = 376
    static let sizeHeight: Double = 874

    
    

    
    struct API {
        static let beeceptorURL = BeeceptorURL("gymswift.free.beeceptor.com")
        static let mockApiURL = MockApiURL("run.mocky.io")
    }
    
    struct Scheme {
        static let https = "https"
        static let http = "http"
    }

    enum HTTP {
        
        enum Method: String {
            case get    = "GET"
            case post   = "POST"
            case delete = "DELETE"
            case put    = "PUT"
        }
    }
    

}
