//
//  PokemonService.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/23/22.
//

import Foundation

protocol PokemonServiceProtocol {
    func fetchAllPokemon() async throws -> [PokemonResult]
}

final class PokemonService {
    func fetchAllPokemon() async throws -> [PokemonResult] {
        let urlString = APIConstants.baseUrl
            .appending("/pokemon?limit=\(APIConstants.pokemonLimit)")
        
        let url = URL(string: urlString)!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decodedData = try JSONDecoder().decode(
            PokemonResultResponse.self,
            from: data
        )
        
        return decodedData.results
    }
}
