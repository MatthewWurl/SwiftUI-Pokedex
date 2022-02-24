//
//  PokemonResult.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/23/22.
//

import Foundation

struct PokemonResultResponse: Codable {
    let results: [PokemonResult]
}

struct PokemonResult: Codable {
    let name: String
    let url: String
}
