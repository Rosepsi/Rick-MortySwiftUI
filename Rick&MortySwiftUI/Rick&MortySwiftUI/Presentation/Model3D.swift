//
//  Model 3D.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 18/4/24.
//

import Foundation

struct Model3D {
    let filename: String
    let id: Int
    
    var url: URL? {
        Bundle.main.url(forResource: filename, withExtension: "usdz")
    }
}
