//
//  APIConstants.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/23/22.
//

import Foundation

enum APIConstants {
    static let baseUrl = "https://pokeapi.co/api/v2"
    static let pokemonLimit = 898
    
    enum Paths {
        static let pokemonResults = "/pokemon?limit=\(APIConstants.pokemonLimit)"
    }
}
