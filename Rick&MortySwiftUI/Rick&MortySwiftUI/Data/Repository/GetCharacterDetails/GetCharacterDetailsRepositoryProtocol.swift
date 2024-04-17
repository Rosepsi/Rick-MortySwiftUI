//
//  GetCharacterDetailsRepositoryProtocol.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

protocol GetCharacterDetailsRepositoryProtocol {
    func get(id: Int) async throws -> CharacterDetailsNetworkModel 
}

// MARK: Dependency Injection

private struct GetCharacterDetailsRepositoryProtocolKey: InjectionKey {
    static var currentValue: any GetCharacterDetailsRepositoryProtocol = GetCharacterDetailsRepository()
}

extension InjectedValues {
    var getCharacterDetailsRepository: any GetCharacterDetailsRepositoryProtocol {
        get { Self[GetCharacterDetailsRepositoryProtocolKey.self] }
        set { Self[GetCharacterDetailsRepositoryProtocolKey.self] = newValue }
    }
}
