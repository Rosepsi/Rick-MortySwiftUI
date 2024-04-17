//
//  CharacterDetailsService.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

final class CharacterDetailsService: CharacterDetailsServiceProtocol {
    
    @Injected(\.networkManager)
    private var networkManager: NetworkManagerProtocol
    
    func execute(id: Int) async throws -> CharacterDetailsNetworkModel {
        guard let url = URLComponents.characters(id: id).url else {
            preconditionFailure("Unable to get URL from URLComponents")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return try await networkManager.fetch(for: request, with: CharacterDetailsNetworkModel.self)
    }
    
}

private extension URLComponents {
    static func characters(id: Int) -> Self {
        Self(path: "/api/character/\(id)")
    }
}
