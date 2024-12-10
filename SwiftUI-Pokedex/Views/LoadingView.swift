//
//  LoadingView.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/23/22.
//

import SwiftUI

struct LoadingView: View {
    // MARK: - PROPERTIES
    let text: String
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 10) {
            ProgressView()
            Text(text)
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    LoadingView(text: "Loading...")
        .padding()
}
