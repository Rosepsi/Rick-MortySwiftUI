//
//  GetCharacterDetailsUseTests.swift
//  Rick&MortySwiftUITests
//
//  Created by Rosa Herrero on 18/4/24.
//

@testable import Rick_MortySwiftUI
import XCTest

final class GetCharacterDetailsUseTests: XCTestCase {
    
    func testSuccess() async throws {
        InjectedValues[\.getCharacterDetailsRepository] = GetCharacterDetailsRepositoryMock()
        let detailsUseCase = GetCharacterDetailsUseCase()
        let getDetails = try await detailsUseCase.execute(id: 1)
        XCTAssertEqual(getDetails.name, "Rick Sanchez")
    }
    
    func testFailed() async throws {
        let mock = GetCharacterDetailsRepositoryMock()
        mock.forceError = true
        InjectedValues[\.getCharacterDetailsRepository] = mock
        let detailsUseCase = GetCharacterDetailsUseCase()
        do {
            let details = try await detailsUseCase.execute(id: 1)
            XCTAssertNil(details)
        } catch {
            // We want to force a throw
        }
        
    }
}


class GetCharacterDetailsRepositoryMock: GetCharacterDetailsRepositoryProtocol {
    
    var forceError: Bool = false
    
    func get(id: Int) async throws -> CharacterDetailsNetworkModel {
        if forceError {
            throw GetCharacterDetailsRepositoryMockError.serializationError
        }
        let responseMock = """
            {
                "id": 1,
                "name": "Rick Sanchez",
                "status": "Alive",
                "species": "Human",
                "type": "",
                "gender": "Male",
                "origin": {
                  "name": "Earth",
                  "url": "https://rickandmortyapi.com/api/location/1"
                },
                "location": {
                  "name": "Earth",
                  "url": "https://rickandmortyapi.com/api/location/20"
                },
                "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                "episode": [
                  "https://rickandmortyapi.com/api/episode/1",
                  "https://rickandmortyapi.com/api/episode/2"
                ],
                "url": "https://rickandmortyapi.com/api/character/1",
                "created": "2017-11-04T18:48:46.250Z"
          }
    """
        let data = responseMock.data(using: .utf8)
        return try JSONDecoder().decode(CharacterDetailsNetworkModel.self, from: data!)
    }
}

enum GetCharacterDetailsRepositoryMockError: Error {
    case serializationError
}
