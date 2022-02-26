//
//  Pokemon.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/18/22.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    let height: Int
    let id: Int
    let name: String
    let types: [PokemonType]
    let weight: Int
    
    static let samplePokemon = Pokemon(
        height: 7,
        id: 1,
        name: "Bulbasaur",
        types: [
            PokemonType(slot: 1, type: Result(name: "Grass", url: "")),
            PokemonType(slot: 2, type: Result(name: "Poison", url: ""))
        ],
        weight: 69
    )
}

struct PokemonType: Codable {
    let slot: Int
    let type: Result
}
