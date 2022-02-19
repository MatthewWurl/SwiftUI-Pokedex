//
//  PokedexView.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/17/22.
//

import SwiftUI

struct PokedexView: View {
    @StateObject var pokemonViewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            List(pokemonViewModel.pokemon, id: \.name) { pokemon in
                Text(pokemon.name)
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
