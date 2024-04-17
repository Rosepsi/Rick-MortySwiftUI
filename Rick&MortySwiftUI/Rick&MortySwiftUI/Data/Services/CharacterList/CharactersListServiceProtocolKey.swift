//
//  CharactersListServiceProtocol.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

protocol CharactersListServiceProtocol {
    func execute() async throws -> CharactersListNetworkModel
}

// MARK: Dependency Injection

private struct CharactersListServiceProtocolKey: InjectionKey {
    static var currentValue: any CharactersListServiceProtocol = CharactersListService()
}

extension InjectedValues {
    var charactersListService: any CharactersListServiceProtocol {
        get { Self[CharactersListServiceProtocolKey.self] }
        set { Self[CharactersListServiceProtocolKey.self] = newValue }
    }
}
