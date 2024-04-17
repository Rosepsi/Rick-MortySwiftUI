//
//  CharactersServiceProtocol.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

protocol CharactersServiceProtocol {
    func execute() async throws -> CharacterDTO 
}

// MARK: Dependency Injection

private struct CharactersServiceProtocolKey: InjectionKey {
    static var currentValue: any CharactersServiceProtocol = CharactersService()
}

extension InjectedValues {
    var charactersService: any CharactersServiceProtocol {
        get { Self[CharactersServiceProtocolKey.self] }
        set { Self[CharactersServiceProtocolKey.self] = newValue }
    }
}
