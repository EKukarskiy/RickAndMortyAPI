//
//  ContentView.swift
//  RickAndMortyAPI
//
//  Created by Evgeniy K on 20.03.2024.
//

import SwiftUI

// MARK: - Main screen view

struct ContentView: View {

    @StateObject var contentViewModel = ViewModel()

    var body: some View {
        NavigationStack {

            List(contentViewModel.characters, id: \.id) { character in
                NavigationLink(destination: CharacterView(character: character)) {
                    CharacterListView(character: character)
                }
            }
            .listStyle(.plain)
            .padding()
            .task {
                await contentViewModel.fetchAllCaracters()
            }
            .navigationTitle("Rick and Morty")
        }
    }
}

#Preview {
    ContentView()
}
