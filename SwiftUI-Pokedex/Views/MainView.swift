//
//  MainView.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 12/13/22.
//

import SwiftUI

struct MainView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        TabView {
            PokedexView()
                .tabItem {
                    Label("Pokédex", systemImage: "text.book.closed")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

// MARK: - PREVIEW
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
