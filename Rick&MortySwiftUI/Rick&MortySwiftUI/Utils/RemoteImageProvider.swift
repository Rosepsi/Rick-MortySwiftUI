//
//  RemoteImageProvider.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 18/4/24.
//

import Foundation
import Kingfisher
import SwiftUI


struct RemoteImageProvider: View {
    
    let image: String
    
    var body: some View {
        KFImage(URL(string: image)!)
            .resizable()
    }
}


