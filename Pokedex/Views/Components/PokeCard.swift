//
//  PokeCard.swift
//  Pokedex
//
//  Created by Maegan Wilson on 11/18/22.
//

import SwiftUI

struct PokeCard: View {
    var name: String
    var pTypes: [PokemonType]
    var color: Color
    var pImage: Image

    var body: some View {
        ZStack(alignment: .topLeading) {
            pImage.position(x: 120, y: 100-25)
            VStack(alignment: .leading) {
                Text(name.capitalized)
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(pTypes, id: \.self) { pType in
                        Text(pType.type.name.capitalized)
                            .font(.caption)
                            .padding(4)
                            .background(Material.thinMaterial)
                            .cornerRadius(20)
                    }
                }
            }.padding(.leading, 10.0).padding(.top, 10.0)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(color)
            .cornerRadius(20)
    }
}

//struct PokeCard_Previews: PreviewProvider {
//    static var previews: some View {
//        PokeCard(name: "Pikachu", pTypes: ["Electric"], color: .yellow, pImage: Image(systemSymbol: .bolt))
//    }
//}
