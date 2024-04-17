//
//  NetworkManager.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetch<Response: Decodable>(for request: URLRequest, with type: Response.Type) async throws -> Response
}

struct NetworkManager: NetworkManagerProtocol {
    @Injected(\.urlSession)
    private var urlSession: URLSession
    @Injected(\.jsonDecoder)
    private var jsonDecoder: JSONDecoder
    
    func fetch<Response>(for request: URLRequest, with type: Response.Type) async throws -> Response where Response : Decodable {
        do {
            let result: (data: Data, response: URLResponse) = try await urlSession.data(for: request)
            guard let statusCode = (result.response as? HTTPURLResponse)?.statusCode else {
                throw NetworkManagerError.invalidResponse
            }
            
            guard 200...299 ~= statusCode else {
                throw NetworkManagerError.invalidCode(statusCode)
            }
            
            return try jsonDecoder.decode(Response.self, from: result.data)
        } catch {
            throw error
        }
    }
}

enum NetworkManagerError: Error {
    case invalidResponse
    case invalidCode(_ statusCode: Int)
}
