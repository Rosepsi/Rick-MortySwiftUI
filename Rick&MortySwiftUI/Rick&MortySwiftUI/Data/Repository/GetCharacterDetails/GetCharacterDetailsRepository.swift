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
    
    private var characterDetails: CharacterDetailsNetworkModel?
    
    func get() async throws -> CharacterDetailsNetworkModel {
        if let characterDetails {
            return characterDetails
        }
        let details = try await characterDetailsService.execute()
        characterDetails = details
        return details
    }
}
