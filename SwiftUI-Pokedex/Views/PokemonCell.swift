//
//  PokemonCell.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/21/22.
//

import Kingfisher
import SwiftUI

struct PokemonCell: View {
    // MARK: - PROPERTIES
    let result: PokemonResult
    
    // MARK: - BODY
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(result.name.capitalized)
                    .font(.subheadline.bold())
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .minimumScaleFactor(0.6)
                
                HStack(spacing: 5) {
                    ForEach(result.typeIconNames, id: \.self) { typeIcon in
                        Image(typeIcon)
                            .typeIconStyle()
                    }
                }
            }
            
            Spacer()
            
            KFImage(result.imageUrl)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 10)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(result.colorName))
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    PokemonCell(result: PokemonResult.allResults[5])
        .frame(width: 160, height: 90)
        .padding()
}
