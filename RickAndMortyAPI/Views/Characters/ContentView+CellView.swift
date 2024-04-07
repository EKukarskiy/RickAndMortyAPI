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
            static let radius: CGFloat = 20
            static let opacity: Double = 0.9
            static let horizontalSpacing: CGFloat = 20
            static let horizontalPadding: CGFloat = 7
        }

        var body: some View {

            HStack(spacing: Constants.horizontalSpacing) {
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
            .padding(Constants.horizontalPadding)
            .background(.black).opacity(Constants.opacity)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: Constants.radius))
            .overlay(
                RoundedRectangle(cornerRadius: Constants.radius)
                    .stroke()
                    .fill(.white.opacity(Constants.opacity))
            )
        }
    }
}

#Preview {
    ContentView.CellView(character: Character.testCharacter())
}
