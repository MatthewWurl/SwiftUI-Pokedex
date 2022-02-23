//
//  PokedexView.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/17/22.
//

import SwiftUI

struct PokedexView: View {
    @StateObject var pokemonViewModel = PokemonViewModel()
    
    private let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(pokemonViewModel.pokemon, id: \.name) { pokemon in
                        NavigationLink {
                            PokemonDetailView()
                        } label: {
                            PokemonCell(pokemon: pokemon)
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
            .navigationTitle("Pokédex")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
