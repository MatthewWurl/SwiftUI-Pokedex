//
//  PokemonViewModel.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/18/22.
//

import Foundation

final class PokemonViewModel: ObservableObject {
    @Published private(set) var pokemonResults: [PokemonResult] = Bundle.main.decode("pokemon.json")
}
