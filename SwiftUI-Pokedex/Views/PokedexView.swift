//
//  PokedexView.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/17/22.
//

import SwiftUI

struct PokedexView: View {
    @StateObject private var pokemonViewModel = PokemonViewModel(
        service: PokemonService()
    )
    
    private let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(pokemonViewModel.pokemonResults, id: \.name) { result in
                        NavigationLink {
                            PokemonDetailView()
                        } label: {
//                            PokemonCell(pokemon: pokemon)
                            Text(result.name)
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
            .navigationTitle("Pokédex")
        }
        .overlay {
            if pokemonViewModel.pokemonResults.isEmpty {
                LoadingView(text: "Loading Pokémon...")
            }
        }
        .task {
            await pokemonViewModel.getAllPokemon()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
