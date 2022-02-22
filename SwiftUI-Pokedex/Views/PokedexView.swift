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
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(pokemonViewModel.pokemon, id: \.name) { pokemon in
                        PokemonCell()
                    }
                }
                .padding(.horizontal)
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
