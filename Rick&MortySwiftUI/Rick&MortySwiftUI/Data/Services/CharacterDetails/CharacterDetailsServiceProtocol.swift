//
//  CharacterDetailsServiceProtocol.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

protocol CharacterDetailsServiceProtocol {
    func execute(id: Int) async throws -> CharacterDetailsNetworkModel
}

// MARK: Dependency Injection

private struct CharacterDetailsServiceProtocolKey: InjectionKey {
    static var currentValue: any CharacterDetailsServiceProtocol = CharacterDetailsService()
}

extension InjectedValues {
    var characterDetailsService: any CharacterDetailsServiceProtocol {
        get { Self[CharacterDetailsServiceProtocolKey.self] }
        set { Self[CharacterDetailsServiceProtocolKey.self] = newValue }
    }
}
