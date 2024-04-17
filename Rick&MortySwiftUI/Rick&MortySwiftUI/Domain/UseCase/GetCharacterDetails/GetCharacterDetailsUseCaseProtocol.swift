//
//  GetCharacterDetailsUseCaseProtocol.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

protocol GetCharacterDetailsUseCaseProtocol {
    func execute(id:Int) async throws -> CharacterDetails 
}

// MARK: Dependency Injection

private struct GetCharacterDetailsUseCaseProtocolKey: InjectionKey {
    static var currentValue: any GetCharacterDetailsUseCaseProtocol = GetCharacterDetailsUseCase()
}

extension InjectedValues {
    var getCharacterDetailsUseCase: any GetCharacterDetailsUseCaseProtocol {
        get { Self[GetCharacterDetailsUseCaseProtocolKey.self] }
        set { Self[GetCharacterDetailsUseCaseProtocolKey.self] = newValue }
    }
}
