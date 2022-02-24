//
//  PokemonViewModel.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/18/22.
//

import Foundation

protocol PokemonViewModelProtocol: ObservableObject {
    func getAllPokemon() async
}

@MainActor
final class PokemonViewModel: PokemonViewModelProtocol {
    @Published private(set) var pokemonResults = [PokemonResult]()
    
    // 1. Makes the view model more testable
    // 2. Allows a service to be shared across multiple view models
    private let service: PokemonService
    
    init(service: PokemonService) {
        self.service = service
    }
    
    func getAllPokemon() async {
        do {
            self.pokemonResults = try await service.fetchAllPokemon()
        } catch {
            print("Error getting all Pokemon: \(error)")
        }
    }
}
