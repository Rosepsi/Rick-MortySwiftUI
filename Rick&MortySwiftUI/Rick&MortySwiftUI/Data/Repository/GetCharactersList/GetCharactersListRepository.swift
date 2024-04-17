//
//  GetCharactersListRepository.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

class GetCharactersListRepository: GetCharactersListRepositoryProtocol {
    
    @Injected(\.charactersListService)
    private var charactersListService: CharactersListServiceProtocol
    
    private var charactersList: CharactersListNetworkModel?
    
    func get() async throws -> CharactersListNetworkModel {
        if let charactersList {
            return charactersList
        }
        let list = try await charactersListService.execute()
        charactersList = list
        return list
    }
}
