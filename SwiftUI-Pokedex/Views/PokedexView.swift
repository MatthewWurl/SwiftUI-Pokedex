//
//  PokedexView.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/17/22.
//

import SwiftUI

struct PokedexView: View {
    // MARK: - PROPERTIES
    @State private var isShowingSortDialog = false
    @StateObject private var pokemonVM = PokemonViewModel()
    
    private let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView {
                Text(pokemonVM.resultsCountString)
                    .font(.system(size: 14))
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(pokemonVM.filteredResults) { result in
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
            .toolbar {
                sortButton
            }
            .confirmationDialog("Sort By", isPresented: $isShowingSortDialog) {
                Button("ID") { }
                Button("Name") { }
            } message: {
                Text("Sort By")
            }
            .overlay {
                if pokemonVM.shouldShowContentUnavailable {
                    ContentUnavailableView.search(text: pokemonVM.searchText)
                }
            }
        }
        .searchable(text: $pokemonVM.searchText)
        .autocorrectionDisabled(true)
        .textInputAutocapitalization(.never)
        .overlay {
            if pokemonVM.isLoading {
                LoadingView(text: "Loading Pokémon...")
            }
        }
    }
    
    private var sortButton: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button("Sort") {
                isShowingSortDialog = true
            }
        }
    }
}

// MARK: - PREVIEW
#Preview {
    PokedexView()
}
