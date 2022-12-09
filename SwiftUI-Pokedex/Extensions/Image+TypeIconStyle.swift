//
//  Image+TypeIconStyle.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 12/9/22.
//

import SwiftUI

extension Image {
    func typeIconStyle() -> some View {
        ZStack {
            Circle()
                .stroke(.black.opacity(0.6), lineWidth: 1.5)
            
            self
                .resizable()
                .scaledToFit()
        }
        .shadow(radius: 2)
        .frame(width: 20, height: 20)
    }
}
