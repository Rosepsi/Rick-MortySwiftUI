//
//  GetCharactersUseCase.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

final class GetCharactersUseCase: GetCharactersUseCaseProtocol {
    
    @Injected(\.getCharactersRepository)
    private var getCharactersRepository: GetCharactersRepositoryProtocol
    
    func execute() async throws -> [Character] {
        let response = try await getCharactersRepository.get()
        return response.results.map({ Character(name: $0.name, image: $0.image, url: $0.url, id: $0.id) })
    }
}
