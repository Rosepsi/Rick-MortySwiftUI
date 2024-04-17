//
//  CharactersServices.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

final class CharactersServices: CharactersServicesProtocol {
    
    @Injected(\.urlSession)
    private var urlSession: URLSession
    
    func execute() {}
    
}
