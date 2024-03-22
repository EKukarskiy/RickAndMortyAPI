//
//  Model.swift
//  RickAndMortyAPI
//
//  Created by Evgeniy K on 21.03.2024.
//

import Foundation

// MARK: - JSON Model
struct Character: Identifiable, Decodable, Hashable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
}

// MARK: - JSON Query
struct Query: Decodable {
    let results: [Character]
}

// MARK: - Preview data
struct TestData {
    static let character = Character(id: 001, name: "John Weak", status: "Alive", species: "Human", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/16.jpeg")
}
