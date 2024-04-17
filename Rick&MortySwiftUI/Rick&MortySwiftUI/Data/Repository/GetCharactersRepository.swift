//
//  GetCharactersRepository.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

class GetCharactersRepository: GetCharactersRepositoryProtocol {
    
    @Injected(\.charactersService)
    private var charactersService: CharactersServiceProtocol
    
    private var characters: CharacterDTO?
    
    func get() async throws -> CharacterDTO {
        if let characters {
            return characters
        }
        let result = try await charactersService.execute()
        characters = result
        return result
    }
}
