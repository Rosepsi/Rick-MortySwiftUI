//
//  GetCharactersListRepositoryTests.swift
//  Rick&MortySwiftUITests
//
//  Created by Rosa Herrero on 17/4/24.
//

@testable import Rick_MortySwiftUI
import XCTest

final class GetCharactersListRepositoryTests: XCTestCase {
    
    func testSuccess() async throws {
        InjectedValues[\.charactersListService] = CharactersListServiceMock()
        let list = GetCharactersListRepository()
        let getList = try await list.get()
        XCTAssertFalse(getList.results.isEmpty)
    }
    
    func testCache() async throws {
        let mock = CharactersListServiceMock()
        InjectedValues[\.charactersListService] = mock
        let list = GetCharactersListRepository()
        let getList = try await list.get()
        let getNewList = try await list.get()
        XCTAssertEqual(mock.numberOfCalls, 1)
        XCTAssertEqual(getList.info.next, getNewList.info.next)
    }
}

class CharactersListServiceMock: CharactersListServiceProtocol {
    
    var numberOfCalls = 0
    
    func execute() async throws -> CharactersListNetworkModel {
        numberOfCalls += 1
        let responseMock = """
        {
            "info": {
              "count": 826,
              "pages": 42,
              "next": "https://rickandmortyapi.com/api/character/?page=2",
              "prev": null
            },
            "results": [
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
            ]
          }
    """
        let data = responseMock.data(using: .utf8)
        return try JSONDecoder().decode(CharactersListNetworkModel.self, from: data!)
    }
}
