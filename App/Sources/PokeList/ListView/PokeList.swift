// PokeList.swift
// 
// 
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github	  @heyjaywilson
//               website  cctplus.dev

import SwiftUI
import PokeApiService

public struct PokeList: View {

    public init() {}

    @State private var selectedPokemon: [Pokemon] = []
    @State private var pokes: [Pokemon] = []

    @StateObject private var viewModel = PokeListViewModel()

    private let gridItems = [GridItem(spacing: 10), GridItem(spacing: 10)]

    public var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 10) {
                    ForEach(viewModel.pokemon) { pokemon in
                        NavigationLink(
                            value: pokemon,
                            label: {
                                PokeCard(
                                    name: pokemon.name,
                                    pokeTypes: pokemon.pTypes,
                                    sprites: pokemon.sprites,
                                    species: pokemon.species
                                ).foregroundColor(.primary)
                            }).task {
                                await viewModel.loadMore()
                            }
                    }
                }.navigationTitle(Text("Pokedex"))
                    .navigationBarTitleDisplayMode(.large)
                    .padding()
                    .navigationDestination(for: Pokemon.self) { poke in
                        PokeDetail(pokeInfo: poke)
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
