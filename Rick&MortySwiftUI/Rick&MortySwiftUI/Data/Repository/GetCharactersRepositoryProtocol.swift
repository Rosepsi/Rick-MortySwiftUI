//
//  GetCharactersRepositoryProtocol.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

protocol GetCharactersRepositoryProtocol {
    func get() async throws -> CharacterDTO 
}

// MARK: Dependency Injection

private struct GetCharactersRepositoryProtocolKey: InjectionKey {
    static var currentValue: any GetCharactersRepositoryProtocol = GetCharactersRepository()
}

extension InjectedValues {
    var getCharactersRepository: any GetCharactersRepositoryProtocol {
        get { Self[GetCharactersRepositoryProtocolKey.self] }
        set { Self[GetCharactersRepositoryProtocolKey.self] = newValue }
    }
}
