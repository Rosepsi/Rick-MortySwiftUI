//
//  CharacterDetailsNetworkModel.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

struct CharacterDetailsNetworkModel: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: CharacterDetailsOriginNetworkModel
    let location: CharacterDetailsLocationNetworkModel
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

extension CharacterDetailsNetworkModel {
    
    struct CharacterDetailsOriginNetworkModel: Decodable {
        let name: String
        let url: String
    }
    
    struct CharacterDetailsLocationNetworkModel: Decodable {
        let name: String
        let url: String
    }
}
