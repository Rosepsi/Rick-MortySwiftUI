//
//  GetCharactersListUseCaseProtocol .swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

protocol GetCharactersListUseCaseProtocol {
    func execute() async throws -> [Character]
}

// MARK: Dependency Injection

private struct GetCharactersListUseCaseProtocolKey: InjectionKey {
    static var currentValue: any GetCharactersListUseCaseProtocol = GetCharactersListUseCase()
}

extension InjectedValues {
    var getCharactersListUseCase: any GetCharactersListUseCaseProtocol {
        get { Self[GetCharactersListUseCaseProtocolKey.self] }
        set { Self[GetCharactersListUseCaseProtocolKey.self] = newValue }
    }
}
