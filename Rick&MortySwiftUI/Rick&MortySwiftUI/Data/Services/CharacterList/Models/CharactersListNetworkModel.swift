//
//  CharactersListNetworkModel.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

struct CharactersListNetworkModel: Decodable {
    let info: InfoCharacterListNetworkModel
    let results: [ResultsCharacterListNetworkModel]
}

extension CharactersListNetworkModel {
    struct InfoCharacterListNetworkModel: Decodable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    struct ResultsCharacterListNetworkModel: Decodable {
        let id: Int
        let name: String
        let status: String
        let species: String
        let type: String
        let gender: String
        let origin: CharacterListOriginNetworkModel
        let location: CharacterListLocationNetworkModel
        let image: String
        let episode: [String]
        let url: String
        let created: String
    }
}

extension CharactersListNetworkModel.ResultsCharacterListNetworkModel {
   
    struct CharacterListOriginNetworkModel: Decodable {
        let name: String
        let url: String
    }
    
    struct CharacterListLocationNetworkModel: Decodable {
        let name: String
        let url: String
    }
}
