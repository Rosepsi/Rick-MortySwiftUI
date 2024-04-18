//
//  CardCharacterView.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 19/4/24.
//

import SwiftUI

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
