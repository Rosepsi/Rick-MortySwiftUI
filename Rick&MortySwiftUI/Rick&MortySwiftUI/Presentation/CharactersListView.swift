//
//  CharactersListView.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import Foundation
import SwiftUI

struct CharactersListView: View {
    
    @ObservedObject var viewModel: CharactersListViewModel
    
    init(viewModel: CharactersListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(viewModel.characters, id: \.id) { character in
                    Text(character.name)
                }
            }
        }
        .onAppear() {
            viewModel.fecth()
        }
    }
}
