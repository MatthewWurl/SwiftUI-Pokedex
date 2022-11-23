//
//  PokedexView.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/17/22.
//

import SwiftUI

struct PokedexView: View {
    @StateObject private var pokemonViewModel = PokemonViewModel()
    
    @State private var searchText = ""
    
    private let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var isLoading: Bool {
        pokemonViewModel.pokemonResults.isEmpty
    }
    
    var filteredResults: [PokemonResult] {
        if searchText.isEmpty {
            return pokemonViewModel.pokemonResults
        } else {
            return pokemonViewModel.pokemonResults.filter { result in
                result.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(filteredResults, id: \.id) { result in
                        NavigationLink {
                            PokemonDetailView()
                        } label: {
                            PokemonCell(result: result)
                        }
                    }
                }
//                .searchable(text: $searchText)
                
                .disableAutocorrection(true)
                .padding(.horizontal, 10)
            }
            .navigationTitle("Pokédex")
        }
        .searchable(text: $searchText)
        .overlay {
            if isLoading {
                LoadingView(text: "Loading Pokémon...")
            }
        }
        .onAppear {
            pokemonViewModel.fetchPokemonResults()
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
