// PokeCard.swift
// 
// 
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github	  @heyjaywilson
//               website  cctplus.dev

import SwiftUI
import SFSafeSymbols
import PokeApiService

struct PokeCard: View {
    var name: String
    var pokeTypes: [PokemonType]
    var color: Color
    var sprites: PokemonSprites
    var species: NamedAPIResource

    @StateObject private var viewModel = PokeCardViewModel()

    var body: some View {
        ZStack(alignment: .topLeading) {
            AsyncImage(url: viewModel.image(from: sprites)) { img in
                img
            } placeholder: {
                ProgressView()
            }.position(x: 120, y: 100-35)
            VStack(alignment: .leading) {
                Text(name.capitalized)
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(pokeTypes, id: \.self) { pType in
                        Text(pType.type.name.capitalized)
                            .font(.caption)
                            .padding(4)
                            .background(Material.thinMaterial)
                            .cornerRadius(20)
                    }
                }
            }.padding(.leading, 10.0).padding(.top, 10.0)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(viewModel.color)
            .cornerRadius(20)
            .task {
                await viewModel.setSpeciesInfo(for: species)
            }
    }

    func pokeImage() -> Image {
        return Image(systemSymbol: .pawprint)
    }
}
