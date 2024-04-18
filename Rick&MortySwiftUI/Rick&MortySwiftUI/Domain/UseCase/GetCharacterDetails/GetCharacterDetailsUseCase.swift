//
//  GetCharacterDetailsUseCase.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

final class GetCharacterDetailsUseCase: GetCharacterDetailsUseCaseProtocol {
    
    @Injected(\.getCharacterDetailsRepository)
    private var getCharacterDetailsRepository: GetCharacterDetailsRepositoryProtocol
    
    func execute(id:Int) async throws -> Character {
        let response = try await getCharacterDetailsRepository.get(id: id)
        return Character(networkModel: response)
    }
}
