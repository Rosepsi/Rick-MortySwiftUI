//
//  URLSession.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

extension InjectedValues {
    var urlSession: URLSession {
        get { Self[URLSessionKey.self] }
        set { Self[URLSessionKey.self] = newValue}
    }
}

struct URLSessionKey: InjectionKey {
    static var currentValue: URLSession = {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 30.0
        sessionConfig.timeoutIntervalForResource = 60.0
        return URLSession(configuration: sessionConfig)
    }()
}
