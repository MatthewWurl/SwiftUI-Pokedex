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
    
    @State private var searchText = ""
    
    private let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var isLoading: Bool {
        pokemonViewModel.pokemonResults.isEmpty
    }
    
    var filteredResults: [PokemonResult] {
        searchText == "" ? (
            pokemonViewModel.pokemonResults
        ) : (
            pokemonViewModel.pokemonResults.filter { pokemon in
                let lowercasedName = pokemon.name.lowercased()
                let lowercasedSearch = searchText.lowercased()
                
                return lowercasedName.contains(lowercasedSearch)
            }
        )
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(filteredResults, id: \.name) { result in
                        NavigationLink {
                            PokemonDetailView()
                        } label: {
                            //                            PokemonCell(pokemon: pokemon)
                            Text(result.name)
                        }
                    }
                }
                .searchable(text: $searchText)
                .padding(.horizontal, 10)
            }
            .navigationTitle("Pokédex")
        }
        .overlay {
            if isLoading {
                LoadingView(text: "Loading Pokémon...")
            }
        }
        .task {
            await pokemonViewModel.getPokemonResults()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
