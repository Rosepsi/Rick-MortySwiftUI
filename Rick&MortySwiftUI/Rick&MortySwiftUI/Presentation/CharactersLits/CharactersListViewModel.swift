//
//  CharactersListViewModel.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

class CharactersListViewModel: ObservableObject {
    
    @Injected(\.getCharactersListUseCase)
    private var getCharactersListUseCase: GetCharactersListUseCaseProtocol
    
    @Published var characters: [Character] = []
    
    func fecth() {
        Task {
            do {
                let fetchedCharacters = try await getCharactersListUseCase.execute()
                DispatchQueue.main.async {
                    self.characters = fetchedCharacters
                }
            } catch {
                // show errors to the users
            }
        }
    }
}
