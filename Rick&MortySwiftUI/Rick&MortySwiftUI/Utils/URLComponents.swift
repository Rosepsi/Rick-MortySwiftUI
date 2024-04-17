//
//  URLComponents.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

extension URLComponents {
    init(host: String = Constants.host, path: String, queryItems: [URLQueryItem]? = nil) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        components.queryItems = queryItems
        self = components
    }
}
