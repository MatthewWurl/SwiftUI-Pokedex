//
//  PokemonResult.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/25/22.
//

import Foundation

struct PokemonResult: Codable, Identifiable {
    let id: Int
    let name: String
    let types: [String]
}
