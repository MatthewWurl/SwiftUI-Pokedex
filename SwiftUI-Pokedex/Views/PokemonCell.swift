//
//  PokemonCell.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/21/22.
//

import SwiftUI

struct PokemonCell: View {
    let pokemon: Pokemon
    
    var imageUrl: URL {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(pokemon.id).png")!
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(pokemon.types[0]))
            
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(pokemon.name)
                        .font(.subheadline.bold())
                        .foregroundColor(.white)
                        .lineLimit(1)
                    
                    HStack(spacing: 5) {
                        // 1 or 2 type icons...
                        if pokemon.types.count == 1 {
                            Image("TypeIcon_\(pokemon.types[0])")
                                .typeIconStyle()
                        } else {
                            Image("TypeIcon_\(pokemon.types[0])")
                                .typeIconStyle()
                            Image("TypeIcon_\(pokemon.types[1])")
                                .typeIconStyle()
                        }
                    }
                }
                
                Spacer()
                
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                } placeholder: {
                    ProgressView()
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 10)
        }
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: Pokemon.samplePokemonArr[0])
            .frame(width: 160, height: 90)
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
