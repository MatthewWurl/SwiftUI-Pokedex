//
//  Pokemon.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/18/22.
//

import Foundation

struct Pokemon {
    let name: String
    let types: [String]
    
    static let samplePokemonArr = [
        Pokemon(name: "Bulbasaur", types: ["Grass", "Poison"]),
        Pokemon(name: "Charmander", types: ["Fire"]),
        Pokemon(name: "Squirtle", types: ["Water"])
    ]
}
