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
    
    private var filteredResults: [PokemonResult] {
        switch searchText.isEmpty {
        case true:
            return pokemonViewModel.pokemonResults
        case false:
            return pokemonViewModel.pokemonResults.filter { result in
                result.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    private var isLoading: Bool {
        return pokemonViewModel.pokemonResults.isEmpty
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
                .padding(.horizontal, 10)
            }
            .navigationTitle("Pokédex")
        }
        .searchable(text: $searchText)
        .autocorrectionDisabled(true)
        .textInputAutocapitalization(.never)
        .overlay {
            if isLoading {
                LoadingView(text: "Loading Pokémon...")
            }
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
