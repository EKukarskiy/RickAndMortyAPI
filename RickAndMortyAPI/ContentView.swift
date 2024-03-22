//
//  ContentView.swift
//  RickAndMortyAPI
//
//  Created by Evgeniy K on 20.03.2024.
//

import SwiftUI

// MARK: - Main screen view

struct ContentView: View {

    @StateObject var network = Network()

    var body: some View {
        NavigationStack {

            List(network.characters, id: \.id) { character in
                NavigationLink(destination: CharacterView(character: character)) {
                    CharacterListView(character: character)
                }
            }
            .listStyle(.plain)
            .padding()
            .task {
                await network.fetchAllCaracters()
            }
            .navigationTitle("Rick and Morty")
        }
    }
}

#Preview {
    ContentView()
}
