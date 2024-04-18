//
//  CharacterDetailsViewModel.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

class CharacterDetailsViewModel: ObservableObject {
    @Injected(\.getCharacterDetailsUseCase)
    private var getCharacterDetailsUseCase: GetCharacterDetailsUseCaseProtocol
    
    @Published var characterDetails: Character?
    var model3DfileURL: URL?
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func fecth() {
        Task {
            do {
                let fetchCharacterDetails = try await getCharacterDetailsUseCase.execute(id: id)
                DispatchQueue.main.async {
                    self.characterDetails = fetchCharacterDetails
                    if let model = Self.availableModels.first(where: { $0.id == self.id }) {
                        self.model3DfileURL = model.url
                    }
                }
            } catch {
                // show errors to the users
            }
        }
    }
    
    
    static let availableModels: [Model3D] = [Model3D(filename: "rick", id: 1),
                                             Model3D(filename: "morty", id: 2),
                                             Model3D(filename: "beth", id: 4),
                                             Model3D(filename: "summer", id: 3),
                                             Model3D(filename: "jerry", id: 5)]
}
