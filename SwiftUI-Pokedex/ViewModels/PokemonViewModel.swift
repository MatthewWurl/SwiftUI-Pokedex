//
//  PokemonViewModel.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/18/22.
//

import Foundation

final class PokemonViewModel: ObservableObject {
    @Published var searchText: String = ""
    
    private(set) var pokemonResults: [PokemonResult] = Bundle.main.decode("pokemon.json")
    
    var filteredResults: [PokemonResult] {
        get {
            switch searchText.isEmpty {
            case true:
                return pokemonResults
            case false:
                return pokemonResults.filter { result in
                    result.name.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
    }
    
    var isLoading: Bool {
        get {
            pokemonResults.isEmpty
        }
    }
    
    var resultsCountString: String {
        get {
            let count = filteredResults.count
            return "Showing \(count) \(count == 1 ? "result" : "results")."
        }
    }
}
