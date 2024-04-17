//
//  Rick_MortySwiftUIApp.swift
//  Rick&MortySwiftUI
//
//  Created by Rosa Herrero on 17/4/24.
//

import SwiftUI

@main
struct AppDelegate: App {
    var body: some Scene {
        WindowGroup {
            CharactersListView(viewModel: CharactersListViewModel())
        }
    }
}
