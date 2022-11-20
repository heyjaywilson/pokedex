//
//  PokeDetailView.swift
//  Pokedex
//
//  Created by Maegan Wilson on 11/18/22.
//

import SwiftUI
import PokeApiService

struct PokeDetailView: View {
    var pokeInfo: Pokemon

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                ForEach(pokeInfo.pTypes, id: \.self) { pType in
                    Text(pType.type.name.capitalized)
                        .font(.caption)
                        .padding(4)
                        .background(Material.thinMaterial)
                        .cornerRadius(20)
                }
                Spacer()
                VStack {
                    Text("#\(pokeInfo.id)")
                        .font(.headline)
                        .bold()
                    Spacer()
                }.frame(height: 40)
            }.padding(.horizontal)
            Image(systemSymbol: .pawprint)
                    .resizable()
                    .frame(width: 200, height: 200)
            Spacer()
            VStack {
                HStack {
                    Text("About")
                    Text("Base Stats")
                    Text("Evolution")
                    Text("Moves")
                }
            }.frame(maxWidth: .infinity)
                .frame(height: 400)
                .background(Color.primary.colorInvert())
                .background(ignoresSafeAreaEdges: .bottom)
        }.navigationTitle(Text(pokeInfo.name.capitalized))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemSymbol: .heart)
                }
            }
            .background(Color.green)
    }
}

//struct PokeDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            PokeDetailView(pokeInfo: pokemonDataSet[3])
//        }
//    }
//}
