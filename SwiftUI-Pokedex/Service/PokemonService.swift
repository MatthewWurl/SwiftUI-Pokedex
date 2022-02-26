//
//  PokemonService.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/23/22.
//

import Foundation

protocol PokemonServiceProtocol {
    func fetchPokemonResults() async throws -> [Result]
}

final class PokemonService: PokemonServiceProtocol {
    func fetchPokemonResults() async throws -> [Result] {
        let urlString = APIConstants.baseUrl.appending(
            APIConstants.Paths.pokemonResults
        )
        
        let url = URL(string: urlString)!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decodedData = try JSONDecoder().decode(
            PokemonResults.self,
            from: data
        )
        
        return decodedData.results
    }
}
