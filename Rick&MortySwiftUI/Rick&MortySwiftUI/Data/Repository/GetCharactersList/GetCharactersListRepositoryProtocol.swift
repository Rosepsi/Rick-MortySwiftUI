//
//  GetCharactersListRepositoryProtocol.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

protocol GetCharactersListRepositoryProtocol {
    func get() async throws -> CharactersListNetworkModel
}

// MARK: Dependency Injection

private struct GetCharactersListRepositoryProtocolKey: InjectionKey {
    static var currentValue: any GetCharactersListRepositoryProtocol = GetCharactersListRepository()
}

extension InjectedValues {
    var getCharactersListRepository: any GetCharactersListRepositoryProtocol {
        get { Self[GetCharactersListRepositoryProtocolKey.self] }
        set { Self[GetCharactersListRepositoryProtocolKey.self] = newValue }
    }
}
