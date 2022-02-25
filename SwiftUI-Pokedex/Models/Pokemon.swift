//
//  Pokemon.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/18/22.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let name: String
    let id: Int
    let types: [String]
}

extension Pokemon {
    static  let samplePokemonArr = [
        Pokemon(name: "Bulbasaur", id: 1, types: ["Grass", "Poison"]),
        Pokemon(name: "Charmander", id: 4, types: ["Fire"]),
        Pokemon(name: "Squirtle", id: 7, types: ["Water"])
    ]
}
