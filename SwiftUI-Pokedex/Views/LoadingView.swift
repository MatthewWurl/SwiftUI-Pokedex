//
//  LoadingView.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/23/22.
//

import SwiftUI

struct LoadingView: View {
    let text: String
    
    var body: some View {
        VStack(spacing: 10) {
            ProgressView()
            Text(text)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(text: "Loading...")
    }
}
