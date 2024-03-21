//
//  Model.swift
//  RickAndMortyAPI
//
//  Created by Evgeniy K on 21.03.2024.
//

import Foundation

// First screen - list with name, pic, gender
// Second screen - detailed info about character

// MARK: JSON Model

struct Character: Identifiable, Decodable, Hashable {
    let id: Int
    let name: String
    let gender: String
    let image: URL
}

struct Query: Decodable {
    let results: [Character]
}
