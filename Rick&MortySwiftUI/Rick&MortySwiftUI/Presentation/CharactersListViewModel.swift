//
//  CharactersListViewModel.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

protocol CharactersListViewModelProtocol {
    func fecth()
}

class CharactersListViewModel: ObservableObject, CharactersListViewModelProtocol {
    @Injected(\.getCharactersUseCase)
    private var getCharactesrUseCase: GetCharactersUseCaseProtocol
    
    @Published var characters: [Character] = []
    
    func fecth() {
        Task {
            do {
                characters = try await getCharactesrUseCase.execute()
            }
        }
    }
}
