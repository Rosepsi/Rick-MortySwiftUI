//
//  NetworkManagerProtocol.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetch<Response: Decodable>(for request: URLRequest, with type: Response.Type) async throws -> Response
}

// MARK: Dependency Injection

private struct NetworkManagerProtocolKey: InjectionKey {
    static var currentValue: any NetworkManagerProtocol = NetworkManager()
}

extension InjectedValues {
    var networkManager: any NetworkManagerProtocol {
        get { Self[NetworkManagerProtocolKey.self] }
        set { Self[NetworkManagerProtocolKey.self] = newValue }
    }
}
