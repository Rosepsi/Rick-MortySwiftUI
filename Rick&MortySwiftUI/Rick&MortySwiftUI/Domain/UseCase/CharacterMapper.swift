//
//  CharacterMapper.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 18/4/24.
//

import Foundation

extension Character {
    init(networkModel: CharacterDetailsNetworkModel) {
        self.id = networkModel.id
        self.image = networkModel.image
        self.gender = CharacterDetailsGender(rawValue: networkModel.gender) ?? .unknown
        self.status = CharacterDetailsStatus(rawValue: networkModel.status) ?? .unknown
        self.species = networkModel.species
        self.type = networkModel.type
        self.name = networkModel.name
    }
}
