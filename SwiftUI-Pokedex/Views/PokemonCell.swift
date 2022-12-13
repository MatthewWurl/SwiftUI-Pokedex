//
//  PokemonCell.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/21/22.
//

import Kingfisher
import SwiftUI

struct PokemonCell: View {
    let result: PokemonResult
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(result.colorName))
            
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
                    .frame(width: 50, height: 50)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 10)
        }
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static let results: [PokemonResult] = Bundle.main.decode("pokemon.json")
    
    static var previews: some View {
        PokemonCell(result: results[0])
            .previewLayout(.sizeThatFits)
            .frame(width: 160, height: 90)
            .padding()
    }
}
