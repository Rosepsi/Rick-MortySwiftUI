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
    @Injected(\.getCharactersListUseCase)
    private var getCharactesListUseCase: GetCharactersListUseCaseProtocol
    
    @Published var characters: [Character] = []
    
    func fecth() {
        Task {
            do {
                characters = try await getCharactesListUseCase.execute()
            }
        }
    }
}
