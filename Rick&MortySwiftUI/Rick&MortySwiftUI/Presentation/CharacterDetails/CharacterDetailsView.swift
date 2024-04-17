//
//  CharacterDetailsView.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation
import SwiftUI

struct CharacterDetailsView: View {
    
    @ObservedObject var viewModel: CharacterDetailsViewModel
    
    init(viewModel: CharacterDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                if let details = viewModel.characterDetails {
                    Text(details.name)
                    Text(details.status.rawValue)
                    Text(details.species)
                    Text(details.type)
                    Text(details.gender.rawValue)
                }
            }
        }
        .onAppear() {
            viewModel.fecth()
        }
    }
}
