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
    
    func execute() {
        getCharacterRepository.get()
    }
}
