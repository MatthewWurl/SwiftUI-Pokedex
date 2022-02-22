//
//  PokemonCell.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/21/22.
//

import SwiftUI

struct PokemonCell: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color("Grass"))
            
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Bulbasaur")
                        .font(.subheadline.bold())
                        .foregroundColor(.white)
                        .minimumScaleFactor(0.75)
                    
                    HStack(spacing: 5) {
                        Image("GrassIcon").typeIconStyle()
                        Image("PoisonIcon").typeIconStyle()
                    }
                }
                
                Image("Bulbasaur")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 10)
        }
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell()
    }
}

extension Image {
    func typeIconStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
    }
}
