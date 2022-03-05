//
//  PokemonViewModel.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/18/22.
//

import Foundation

typealias PokemonResult = PokemonResultsQuery.Data.Result

protocol PokemonViewModelProtocol: ObservableObject {
    func fetchPokemonResults()
}

final class PokemonViewModel: PokemonViewModelProtocol {
    @Published private(set) var pokemonResults = [PokemonResult]()
    
    func fetchPokemonResults() {
        Network.shared.apollo.fetch(query: PokemonResultsQuery(limit: APIConstants.pokemonLimit)) { result in
            switch result {
            case .success(let graphQLResult):
                if let results = graphQLResult.data?.results {
                    DispatchQueue.main.async {
                        self.pokemonResults = results
                    }
                }
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
}
