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
        static let gptBaseURL = GptBaseURL("api.openai.com/")
//        static let stagingBaseURL = "api.staging.com"
//        static let devBaseURL = "api.dev.com"
        
        
    }
    
    struct Scheme {
        static let https = "https"
        static let http = "http"
    }
    
    struct APIPaths {
        
        

    }

    enum HTTP {
        
        enum Method: String {
            case get    = "GET"
            case post   = "POST"
            case delete = "DELETE"
            case put    = "PUT"
        }
        
        enum Headers {
            
            enum Key: String {
                case contentType = "Content-Type"
            }
            
            enum Value: String {
                case applicationJson = "application/json"
            }
        }
    }
    

}