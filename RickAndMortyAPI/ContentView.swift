//
//  ContentView.swift
//  RickAndMortyAPI
//
//  Created by Evgeniy K on 20.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var network = Network()

    var body: some View {
        VStack {
            List {
                ForEach(network.characters, id: \.self) { character in
                    HStack {
                        Text(character.name)
                        Text(character.gender)
                    }
                }
            }
        }
        .padding()
        .task {
            do {
                let character = try await network.getCharacter()
            } catch {
                print("Error", error)
            }
        }
    }
}

#Preview {
    ContentView()
}
