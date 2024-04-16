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

        switch contentViewModel.contentState {
        case .content(let characters):
            NavigationStack {
                ScrollView {
                    LazyVStack(pinnedViews: .sectionHeaders) {
                        ForEach(characters, id: \.id) { character in
                            NavigationLink(destination: CharacterDetail(character: character)) {
                                CellView(character: character)
                            }
                        }
                    }
                    .padding()
                    .navigationTitle("Rick and Morty")
                }
            }
            .tint(Color(.label))
        case .loading:
            ProgressView()
                .progressViewStyle(.circular)
                .task {
                    await contentViewModel.fetchAllCaracters()
                }
        case .error(let error):
            Text(error.localizedDescription)
                .font(.headline)
        case .emptyData:
            Text("No data found")
                .font(.headline)
        }
    }
}

#Preview {
    ContentView()
}
