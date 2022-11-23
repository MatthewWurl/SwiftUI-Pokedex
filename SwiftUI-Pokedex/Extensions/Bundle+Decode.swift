//
//  Bundle+Decode.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 11/23/22.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ fileName: String) -> T {
        guard let url = url(forResource: fileName, withExtension: nil) else {
            fatalError("Failed to locate \(fileName) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(fileName) from bundle.")
        }
        
        guard let loadedData = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Failed to decode \(fileName) from bundle.")
        }
        
        return loadedData
    }
}
