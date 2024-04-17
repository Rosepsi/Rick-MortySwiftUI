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
    
    func fecth() {
        getCharactersUseCase.execute()
    }
}
