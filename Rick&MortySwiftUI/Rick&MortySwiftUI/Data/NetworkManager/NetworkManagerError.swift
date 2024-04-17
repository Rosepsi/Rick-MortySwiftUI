//
//  NetworkManagerError.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

enum NetworkManagerError: Error {
    case invalidResponse
    case invalidCode(_ statusCode: Int)
}
