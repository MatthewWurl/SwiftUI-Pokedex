//
//  PokemonCell.swift
//  SwiftUI-Pokedex
//
//  Created by Matt X on 2/21/22.
//

import SwiftUI

struct PokemonCell: View {
    let result: PokemonResult
    
    var imageUrl: URL {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(result.id).png")!
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color("\(result.types.first!.capitalized)"))
            
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(result.name.capitalized)
                        .font(.subheadline.bold())
                        .foregroundColor(.white)
                        .lineLimit(1)
                    
                    HStack(spacing: 5) {
                        ForEach(result.types, id: \.self) { type in
                            Image("Type_Icon_\(type.capitalized)")
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
                        .frame(width: 50, height: 50)
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 10)
        }
    }
}

//struct PokemonCell_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonCell(result: )
//            .frame(width: 160, height: 90)
//    }
//}

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
