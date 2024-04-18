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
        NavigationStack {
            VStack(alignment: .leading) {
                List{
                    ForEach(viewModel.characters, id: \.id) { character in
                        NavigationLink(destination: CharacterDetailsView(viewModel: CharacterDetailsViewModel(id: character.id))) {
                            Card(character: character)
                        }
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
                .navigationTitle("Characters")
                .toolbarBackground(Color.blueColor, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar)
                .scrollContentBackground(.hidden)
                .background(Color.blueColor)
                .listStyle(.plain)
            }
        }
        .onAppear() {
            viewModel.fecth()
        }
    }
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView(viewModel: CharactersListViewModel())
    }
}




