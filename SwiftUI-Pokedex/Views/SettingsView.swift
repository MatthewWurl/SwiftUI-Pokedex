//
//  SettingsView.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 12/13/22.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            Text("Settings View")
                .navigationTitle("Settings")
        }
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
