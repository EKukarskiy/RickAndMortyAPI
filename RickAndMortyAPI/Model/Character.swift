//
//  Character.swift
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
    
    struct Origin: Decodable, Hashable {
        let name: String
    }
    let origin: Origin
    
    struct Location: Decodable, Hashable {
        let name: String
    }
    let location: Location
    let image: String
}

// MARK: - JSON Query
struct Query: Decodable {
    let results: [Character]
}

// MARK: - Preview data
extension Character {
    static func testCharacter() -> Character {
        let character = Character(id: 001, name: "John Weak",
                                  status: "Alive",
                                  species: "Human",
                                  gender: "Male",
                                  origin: Character.Origin.init(name: "Earth"),
                                  location: Character.Location(name: "Citadel of Ricks"),
                                  image: "https://rickandmortyapi.com/api/character/avatar/16.jpeg")
        return character
    }
}
