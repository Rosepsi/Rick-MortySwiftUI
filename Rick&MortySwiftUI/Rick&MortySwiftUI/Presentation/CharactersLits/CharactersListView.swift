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


struct Card: View {
    let character: Character
    var body: some View {
        ZStack {
            Color.blueColor
            HStack {
                RemoteImageProvider(image: character.image)
                    .clipped()
                    .cornerRadius(4)
                    .padding(.horizontal, 0)
                    .frame(width: 60, height: 60)
                Text(character.name)
                    .foregroundColor(Color.yellowColor)
                    .padding(.horizontal, 10)
                Spacer()
                Image(systemName: "chevron.right")
                    .resizable()
                    .fixedSize()
                    .foregroundColor(Color.yellowColor)
            }
            .padding(.horizontal, 15)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.yellowColor, lineWidth: 1)
                .shadow(color: Color.black.opacity(0.2), radius: 4)
        )
    }
}


extension Color {
    static let blueColor = Color("BlueColor")
    static let yellowColor = Color("YellowColor")
    static let greenColor = Color("GreenColor")
}
