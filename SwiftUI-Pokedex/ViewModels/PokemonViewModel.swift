//
//  PokemonViewModel.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/18/22.
//

import Foundation

class PokemonViewModel: ObservableObject {
    @Published private(set) var pokemon = [Pokemon]()
    
    // Sample data...
    init() {
        pokemon = [
            Pokemon(name: "Bulbasaur"),
            Pokemon(name: "Charmander"),
            Pokemon(name: "Squirtle")
        ]
    }
}
