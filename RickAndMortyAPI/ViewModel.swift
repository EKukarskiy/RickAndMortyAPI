//
//  ViewModel.swift
//  RickAndMortyAPI
//
//  Created by Evgeniy K on 22.03.2024.
//

import Foundation
import SwiftUI

// MARK: - View Model
final class ViewModel: ObservableObject {
    @Published var characters: [Character] = []

    private let provider = NetworkProvider()
    @MainActor func fetchAllCaracters() async {
        do {
            characters = try await provider.getCharacter()
        } catch {
            print("Catch: \(error)")
        }
    }
}
