//
//  CharacterDetailsViewModel.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

protocol CharacterDetailsViewModelProtocol {
    func fecth()
}

class CharacterDetailsViewModel: ObservableObject, CharacterDetailsViewModelProtocol {
    @Injected(\.getCharacterDetailsUseCase)
    private var getCharacterDetailsUseCase: GetCharacterDetailsUseCaseProtocol
    
    @Published var characterDetails: CharacterDetails?
    
    func fecth() {
        Task {
            do {
                characterDetails = try await getCharacterDetailsUseCase.execute()
            }
        }
    }
}
