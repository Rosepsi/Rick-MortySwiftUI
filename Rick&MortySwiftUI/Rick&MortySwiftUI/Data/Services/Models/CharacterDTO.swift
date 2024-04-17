//
//  CharacterDTO.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

struct CharacterDTO: Decodable {
    let info: InfoCharacterDTO
    let results: [ResultsCharacterDTO]
}

extension CharacterDTO {
    struct InfoCharacterDTO: Decodable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    struct ResultsCharacterDTO: Decodable {
        let id: Int
        let name: String
        let status: CharacterStatusDTO
        let species: String
        let type: String
        let gender: CharacterGenderDTO
        let origin: CharacterOriginDTO
        let location: CharacterLocationDTO
        let image: String
        let episode: [String]
        let url: String
        let created: String
    }
}

extension CharacterDTO.ResultsCharacterDTO {
    enum CharacterStatusDTO: String, Decodable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"
    }
    
    enum CharacterGenderDTO: String, Decodable {
        case male = "Male"
        case female = "Female"
        case genderless = "Genderless"
        case unknown = "unknown"
    }
    
    struct CharacterOriginDTO: Decodable {
        let name: String
        let url: String
    }
    
    struct CharacterLocationDTO: Decodable {
        let name: String
        let url: String
    }
}
