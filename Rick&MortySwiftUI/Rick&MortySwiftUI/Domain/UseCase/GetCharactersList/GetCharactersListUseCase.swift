//
//  GetCharactersListUseCase.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

final class GetCharactersListUseCase: GetCharactersListUseCaseProtocol {
    
    @Injected(\.getCharactersListRepository)
    private var getCharactersListRepository: GetCharactersListRepositoryProtocol
    
    func execute() async throws -> [Character] {
        let response = try await getCharactersListRepository.get()
        return response.results.map({ Character(name: $0.name, image: $0.image, url: $0.url, id: $0.id) })
    }
}
