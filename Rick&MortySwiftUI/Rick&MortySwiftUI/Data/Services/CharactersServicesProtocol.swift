//
//  CharactersServicesProtocol.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

protocol CharactersServicesProtocol {
    func execute() 
}

// MARK: Dependency Injection

private struct CharactersServicesProtocolKey: InjectionKey {
    static var currentValue: any CharactersServicesProtocol = CharactersServices()
}

extension InjectedValues {
    var charactersServices: any CharactersServicesProtocol {
        get { Self[CharactersServicesProtocolKey.self] }
        set { Self[CharactersServicesProtocolKey.self] = newValue }
    }
}
