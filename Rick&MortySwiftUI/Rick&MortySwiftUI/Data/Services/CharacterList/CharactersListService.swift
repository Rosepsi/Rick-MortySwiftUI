//
//  CharactersListService.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

final class CharactersListService: CharactersListServiceProtocol {
    
    @Injected(\.networkManager)
    private var networkManager: NetworkManagerProtocol
    
    func execute() async throws -> CharactersListNetworkModel {
        guard let url = URLComponents.characters().url else {
            preconditionFailure("Unable to get URL from URLComponents")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return try await networkManager.fetch(for: request, with: CharactersListNetworkModel.self)
    }
    
}

private extension URLComponents {
    static func characters() -> Self {
        Self(path: "/api/character")
    }
}

