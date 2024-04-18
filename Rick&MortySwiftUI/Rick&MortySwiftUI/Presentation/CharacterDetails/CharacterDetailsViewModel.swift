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
    
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func fecth() {
        Task {
            do {
                let fetchCharacterDetails = try await getCharacterDetailsUseCase.execute(id: id)
                DispatchQueue.main.async {
                    self.characterDetails = fetchCharacterDetails
                }
            } catch {
                // show errors to the users
            }
        }
    }
}
