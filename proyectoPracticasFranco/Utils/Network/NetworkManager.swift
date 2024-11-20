//
//  NetworkManager.swift
//  proyectoPracticasFranco
//
//  Created by Franco Ramiro Acosta Diaz on 11/11/24.
//

import Foundation

enum NetworkError: Error {
    case badResponse
    case badStatusCode(Int)
    case badData
    case decodingError
    case unknownError
}

class NetworkManager {

    static let shared = NetworkManager()
    private let session: URLSession
    
    private init() {
        // Esto debo de mejorarlo para pasar un closure con la configuracion personalizada
        let configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration)
    }
    
    private func request<T: Codable>(request: URLRequest, taskType: TaskType, downloadPath: String? = nil, data: Data? = nil, completion: @escaping (Result<T, NetworkError>) -> Void) {
        print("Request URL: \(request.url?.absoluteString ?? "Invalid URL")")

        switch taskType {
        case .dataTask:
            let task = session.dataTask(with: request) { data, response, error in
                self.handleResponse(data: data, response: response, error: error, completion: completion)
            }
            task.resume()
        
        case .downloadTask:
            let task = session.downloadTask(with: request) { localURL, response, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    completion(.failure(.unknownError))
                    return
                }
                
                if let localURL = localURL {
                    let destinationURL = FileManager.default.temporaryDirectory.appendingPathComponent(downloadPath!)
                    try? FileManager.default.moveItem(at: localURL, to: destinationURL)
                } else {
                    completion(.failure(.decodingError))
                }
            }
            task.resume()
        case .uploadTask:
            let task = session.uploadTask(with: request, from: data) { data, response, error in
                self.handleResponse(data: data, response: response, error: error, completion: completion)
            }
            task.resume()
        }
    }
    
    private func handleResponse<T: Codable>(data: Data?, response: URLResponse?, error: Error?, completion: @escaping (Result<T, NetworkError>) -> Void) {
        if let error = error {
            print("Error: \(error.localizedDescription)")
            completion(.failure(.unknownError))
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            completion(.failure(.badResponse))
            return
        }
        
        // Aqui tengo que mejorarlo para controlar mas verbose segun los tipos de codigo y tener mas contexto
        guard (200...299).contains(httpResponse.statusCode) else {
            completion(.failure(.badStatusCode(httpResponse.statusCode)))
            return
        }
        
        guard let data = data else {
            completion(.failure(.badData))
            return
        }
        
        if T.self == Data.self {
            print(data, "Esto es asi----<")
            completion(.success(data as! T))
            return
        }

        // Intentar decodificar la respuesta
        do {
            let decoder = JSONDecoder()
            let decodedObject = try decoder.decode(T.self, from: data)
            completion(.success(decodedObject))
        } catch {
            completion(.failure(.decodingError))
        }
    }
    
    // Método público para GET usando dataTask
    func get<T: Codable>(url: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void) {
        request(request: url, taskType: .dataTask, completion: completion)
    }
    
    // Método público para POST usando dataTask
    func post<T: Codable>(url: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void) {
        request(request: url, taskType: .dataTask, completion: completion)
    }
    
    // Método público para obtener un archivo con downloadTask
    func download(url: URLRequest, downloadPath: String, completion: @escaping (Result<URL, NetworkError>) -> Void) {
        request(request: url, taskType: .downloadTask, downloadPath: downloadPath, completion: completion)
    }
    
    // Método público para subir un archivo con uploadTask
    func upload(url: URLRequest, downloadPath: String, data: Data, completion: @escaping (Result<URL, NetworkError>) -> Void) {
        request(request: url, taskType: .downloadTask, downloadPath: downloadPath, data: data, completion: completion)
    }
}

enum TaskType {
    case dataTask
    case uploadTask
    case downloadTask
}
