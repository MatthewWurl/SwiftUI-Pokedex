//
//  PokemonResult.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/23/22.
//

import Foundation

struct PokemonResultResponse: Decodable {
    let results: [PokemonResult]
}

struct PokemonResult: Decodable {
    let name: String
    let url: String
}
