//
//  PokemonViewModel.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/18/22.
//

import Foundation

final class PokemonViewModel: ObservableObject {
    @Published var searchText = ""
    
    private(set) var pokemonResults: [PokemonResult] = Bundle.main.decode("pokemon.json")
    
    var filteredResults: [PokemonResult] {
        switch searchText.isEmpty {
        case true:
            return pokemonResults
        case false:
            return pokemonResults.filter { result in
                result.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var isLoading: Bool { pokemonResults.isEmpty }
    
    var resultsCountString: String {
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
