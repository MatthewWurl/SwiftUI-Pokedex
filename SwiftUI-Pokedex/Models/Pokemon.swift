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
    let types: [String]
    let weight: Int
}
