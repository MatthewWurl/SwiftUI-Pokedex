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
    
    var colorName: String {
        types.first!.capitalized
    }
    
    var imageUrl: URL {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png")!
    }
    
    var typeIconNames: [String] {
        types.map { "Type_Icon_\($0.capitalized)" }
    }
}
