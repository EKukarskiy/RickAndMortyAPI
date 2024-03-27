//
//  ModelData.swift
//  RickAndMortyAPI
//
//  Created by Evgeniy K on 22.03.2024.
//

import Foundation
import SwiftUI

// MARK: - View Model
final class ViewModel: ObservableObject {
    
    enum ContentState {
        case content(_ characters: [Character])
        case loading
        case error(_ error: Error)
        case emptyData
    }
    
    @Published var contentState: ContentState = .loading
    
    private let provider = NetworkProvider()
    
    @MainActor func fetchAllCaracters() async {
        do {
            contentState = .loading
            let characters = try await provider.getCharacter()
            
            if characters.isEmpty {
                contentState = .emptyData
            } else {
                contentState = .content(characters)
            }
        } catch {
            contentState = .error(error)
            print("Catch: \(error)")
        }
    }
}
