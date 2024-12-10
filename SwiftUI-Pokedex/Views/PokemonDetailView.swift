//
//  PokemonDetailView.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/22/22.
//

import SwiftUI

struct PokemonDetailView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        Text("Pokemon Detail View")
            .navigationTitle("Detail")
            .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - PREVIEW
#Preview {
    NavigationView {
        PokemonDetailView()
    }
}
