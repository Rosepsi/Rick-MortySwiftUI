//
//  JSONDecoder.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation

extension InjectedValues {
    var jsonDecoder: JSONDecoder {
        get { Self[JSONDecoderKey.self] }
        set { Self[JSONDecoderKey.self] = newValue}
    }
}

struct JSONDecoderKey: InjectionKey {
    static var currentValue: JSONDecoder = {
        return JSONDecoder()
    }()
}
