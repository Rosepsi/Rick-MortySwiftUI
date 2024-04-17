//
//  GetCharacterDetailsUseCase.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

final class GetCharacterDetailsUseCase: GetCharacterDetailsUseCaseProtocol {
    
    @Injected(\.getCharacterDetailsRepository)
    private var getCharacterDetailsRepository: GetCharacterDetailsRepositoryProtocol
    
    func execute(id:Int) async throws -> CharacterDetails {
        let response = try await getCharacterDetailsRepository.get(id: id)
        return CharacterDetails(networkModel: response)
    }
}

extension CharacterDetails {
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
