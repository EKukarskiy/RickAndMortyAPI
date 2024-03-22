//
//  CaracterView.swift
//  RickAndMortyAPI
//
//  Created by Evgeniy K on 21.03.2024.
//

import SwiftUI

// MARK: - Detailed view of the character

struct CharacterView: View {

    let character: Character

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .image?.resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 180, height: 180)
            }
            
            Text(character.name)
                .font(.title2)
                .fontWeight(.medium)
                .padding()

            Text("Gender: \(character.gender)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)

            Text("Status: \(character.gender)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)

            Text("Type: \(character.species)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    CharacterView(character: TestData.character)
}
