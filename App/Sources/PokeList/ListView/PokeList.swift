// PokeList.swift
// 
// 
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github	  @heyjaywilson
//               website  cctplus.dev

import SwiftUI

public struct PokeList: View {
    private let gridItems = [GridItem(spacing: 10), GridItem(spacing: 10)]

    public init() {}

    @StateObject private var viewModel = PokeListViewModel()

    public var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 10) {
                ForEach(viewModel.pokemon) { pokemon in
                    PokeCard(
                        name: pokemon.name,
                        pokeTypes: pokemon.pTypes,
                        color: Color.red,
                        sprites: pokemon.sprites,
                        species: pokemon.species
                    ).task {
                        await viewModel.loadMore()
                    }
                }
            }
        }.task {
            await viewModel.fetchPokemon()
        }
    }
}

struct PokeList_Previews: PreviewProvider {
    static var previews: some View {
        PokeList()
    }
}
