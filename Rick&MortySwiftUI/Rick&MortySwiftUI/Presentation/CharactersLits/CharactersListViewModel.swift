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
    
    @Published var characters: [Character] = [Character(name: "rick", image:  "https://rickandmortyapi.com/api/character/avatar/1.jpeg", url:  "https://rickandmortyapi.com/api/character/1", id: 1), Character(name: "luis", image:  "https://rickandmortyapi.com/api/character/avatar/1.jpeg", url:  "https://rickandmortyapi.com/api/character/1", id: 2), Character(name: "juan", image:  "https://rickandmortyapi.com/api/character/avatar/1.jpeg", url:  "https://rickandmortyapi.com/api/character/1", id: 3), Character(name: "pedro", image:  "https://rickandmortyapi.com/api/character/avatar/1.jpeg", url:  "https://rickandmortyapi.com/api/character/1", id: 4)]
    
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
