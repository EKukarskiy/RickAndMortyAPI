//
//  CharacterDatail.swift
//  RickAndMortyAPI
//
//  Created by Evgeniy K on 21.03.2024.
//

import SwiftUI

// MARK: - Detailed view of the character

struct CharacterView: View {
    let character: Character
    
    enum Constants {
        static let imageWidth: CGFloat = 240
        static let imaheHeight: CGFloat = 240
    }
    
    var body: some View {
        
        AsyncImage(url: URL(string: character.image)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            Color.gray
        }
        .clipShape(Circle())
        .frame(width: Constants.imageWidth, height: Constants.imaheHeight)
        
        VStack {
            Text(character.name)
                .font(.title)
                .fontWeight(.medium)
                .padding()
            
            Divider()
            
            Group {
                CharacterInfo(title: "Gender", imageName: "person", info: character.gender)
                CharacterInfo(title: "Status", imageName: "shield.lefthalf.filled", info: character.status)
                CharacterInfo(title: "Species", imageName: "pawprint", info: character.species)
                CharacterInfo(title: "Origin", imageName: "globe.europe.africa", info: character.origin.name)
                CharacterInfo(title: "Location", imageName: "mappin", info: character.location.name)
            }
            .padding(3)
        }
        
        Spacer()
    }
}

#Preview {
    CharacterView(character: Character.testCharacter())
}

// MARK: - View with character information to avoid code repetition. Just call it.
struct CharacterInfo: View {
    let title: String
    let imageName: String
    let info: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Label(title, systemImage: imageName)
                    .foregroundStyle(.secondary)
                    .font(.headline)
                Text(info)
                    .font(.body)
            }
            .fontWeight(.semibold)
            Spacer()
        }
        .padding(.leading)
    }
}
