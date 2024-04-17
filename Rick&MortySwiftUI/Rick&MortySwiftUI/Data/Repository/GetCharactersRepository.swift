//
//  GetCharactersRepository.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

class GetCharactersRepository: GetCharactersRepositoryProtocol {
    
    @Injected(\.charactersServices)
    private var charactersServices: CharactersServicesProtocol
    
    func get() {
        charactersServices.execute()
    }
}
