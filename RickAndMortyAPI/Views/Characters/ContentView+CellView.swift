//
//  ContentView+CellView.swift
//  RickAndMortyAPI
//
//  Created by Evgeniy K on 21.03.2024.
//

import SwiftUI

// MARK: - View of each character in the list
extension ContentView {
    struct CellView: View {
        let character: Character
        
        enum Constants {
            static let circleWidth: CGFloat = 50
            static let circleHeight: CGFloat = 50
        }
        
        var body: some View {
            
            HStack(spacing: 20) {
                AsyncImage(url: URL(string: character.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Color.gray
                }
                .clipShape(Circle())
                .frame(width: Constants.circleWidth, height: Constants.circleHeight)
                
                VStack(alignment: .leading) {
                    Text(character.name)
                        .font(.body)
                        .fontWeight(.semibold)
                    
                    Text(character.gender)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .fontWeight(.medium)
                }
                
                Spacer()
            }
            .padding(7)
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
}

#Preview {
    ContentView.CellView(character: Character.testCharacter())
}
