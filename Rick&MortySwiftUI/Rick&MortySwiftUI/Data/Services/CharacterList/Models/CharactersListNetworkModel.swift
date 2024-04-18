//
//  CharactersListNetworkModel.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

struct CharactersListNetworkModel: Decodable {
    let info: InfoCharacterListNetworkModel
    let results: [CharacterDetailsNetworkModel]
}

extension CharactersListNetworkModel {
    struct InfoCharacterListNetworkModel: Decodable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
}
