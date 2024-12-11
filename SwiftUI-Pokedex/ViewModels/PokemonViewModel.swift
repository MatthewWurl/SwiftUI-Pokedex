//
//  PokemonViewModel.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/18/22.
//

import Foundation

final class PokemonViewModel: ObservableObject {
    @Published var searchText = ""
    
    var filteredResults: [PokemonResult] {
        switch searchText.isEmpty {
        case true:
            return PokemonResult.allResults
        case false:
            return PokemonResult.allResults.filter { result in
                result.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var pokemonCountString: String {
        let count = filteredResults.count
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let formattedCount = formatter.string(from: NSNumber(value: count)) ?? String(count)
        
        return "Displaying \(formattedCount) Pokémon."
    }
    
    var shouldShowContentUnavailable: Bool {
        !searchText.isEmpty && filteredResults.isEmpty
    }
}
