//
//  PokemonDetailView.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/22/22.
//

import SwiftUI

struct PokemonDetailView: View {
    var body: some View {
        Text("Pokemon Detail View")
            .navigationTitle("Detail")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PokemonDetailView()
        }
    }
}
