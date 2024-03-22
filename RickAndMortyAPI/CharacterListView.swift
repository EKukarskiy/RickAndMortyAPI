//
//  CharacterListCell.swift
//  RickAndMortyAPI
//
//  Created by Evgeniy K on 21.03.2024.
//

import SwiftUI

// MARK: - View of each character in the list

struct CharacterListView: View {
    let character: Character
    
    var body: some View {
        
        HStack(spacing: 20) {
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .image?.resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
            }
            
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.body)
                    .fontWeight(.semibold)
                
                Text(character.gender)
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    .fontWeight(.medium)
            }
        }
        .padding(7)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.black).opacity(0.9)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke()
                .fill(.white.opacity(0.7))
        )
    }
}

#Preview {
    CharacterListView(character: TestData.character)
}
