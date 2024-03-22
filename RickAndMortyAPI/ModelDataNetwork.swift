//
//  NetworkAndViewModel.swift
//  RickAndMortyAPI
//
//  Created by Evgeniy K on 20.03.2024.
//

import Foundation
import SwiftUI

// MARK: - View Model
final class ModelData: ObservableObject {
    @Published var characters: [Character] = []

    private let store = NetworkProvider()
    @MainActor func fetchAllCaracters() async {
        do {
            characters = try await store.getCharacter()
        } catch {
            print("Catch: \(error)")
        }
    }
}

// MARK: - Network layer
private actor NetworkProvider {
    func getCharacter() async throws -> [Character] {
        var characters = [Character]()

        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            throw CharacterError.invalidURL
        }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw CharacterError.invalidResponse
        }
        guard let decodedCharacter = try? JSONDecoder().decode(Query.self, from: data) else {
            throw CharacterError.decodingError
        }
        characters = decodedCharacter.results
        return characters
    }
}

// MARK: - errors
enum CharacterError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}
