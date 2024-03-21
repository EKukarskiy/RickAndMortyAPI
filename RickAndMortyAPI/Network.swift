//
//  Network.swift
//  RickAndMortyAPI
//
//  Created by Evgeniy K on 20.03.2024.
//

import Foundation
import SwiftUI

class Network: ObservableObject {

    @Published var characters = [Character]()

    func getCharacter() async throws -> [Character] {
        var characters = [Character]()

        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        let decodedCharacter = try JSONDecoder().decode(Query.self, from: data)

        characters = decodedCharacter.results
        print(characters)

        return characters
    }
}
