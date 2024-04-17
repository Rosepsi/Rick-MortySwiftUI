//
//  GetCharacterDetailsRepository.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

class GetCharacterDetailsRepository: GetCharacterDetailsRepositoryProtocol {
    
    @Injected(\.characterDetailsService)
    private var characterDetailsService: CharacterDetailsServiceProtocol
    
    private var characterDetails: [Int: CharacterDetailsNetworkModel] = [:]
    
    func get(id: Int) async throws -> CharacterDetailsNetworkModel {
        if let details = characterDetails[id] {
            return details
        }
        let details = try await characterDetailsService.execute(id: id)
        characterDetails[id] = details
        return details
    }
}
