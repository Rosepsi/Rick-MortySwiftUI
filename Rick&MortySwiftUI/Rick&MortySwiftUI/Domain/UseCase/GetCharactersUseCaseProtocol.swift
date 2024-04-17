//
//  GetCharactersUseCaseProtocol .swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

protocol GetCharactersUseCaseProtocol {
    func execute() async throws -> [Character]
}

// MARK: Dependency Injection

private struct GetCharactersUseCaseProtocolKey: InjectionKey {
    static var currentValue: any GetCharactersUseCaseProtocol = GetCharactersUseCase()
}

extension InjectedValues {
    var getCharactersUseCase: any GetCharactersUseCaseProtocol {
        get { Self[GetCharactersUseCaseProtocolKey.self] }
        set { Self[GetCharactersUseCaseProtocolKey.self] = newValue }
    }
}
