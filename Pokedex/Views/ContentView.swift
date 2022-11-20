//
//  ContentView.swift
//  Pokedex
//
//  Created by Maegan Wilson on 11/18/22.
//

import SwiftUI
import PokeApiService
import SFSafeSymbols

struct PokeCardInfo: Identifiable, Hashable {
    static func == (lhs: PokeCardInfo, rhs: PokeCardInfo) -> Bool {
        lhs.id == rhs.id
    }

    var id: Int
    var name: String
    var pokeType: [PokemonType]
    var image = Image(systemSymbol: .pawprint)
    var color: Color

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct ContentView: View {
    let gridItems = [GridItem(spacing: 10), GridItem(spacing: 10)]

    @State private var selectedPokemon: [Pokemon] = []
    @State private var pokes: [Pokemon] = []

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 10) {
                    ForEach(pokes) { set in
                        NavigationLink(value: set) {
                            PokeCard(
                                name: set.name,
                                pTypes: set.pTypes,
                                color: .red,
                                pImage: Image(systemSymbol: .pawprint))
                        }.foregroundColor(.primary)
                    }.frame(height: 150)
                }.task {
//                    pokes = await PokeService().getPokemon()
                }
            }.navigationTitle(Text("Pokedex"))
                .navigationBarTitleDisplayMode(.large)
                .padding()
                .navigationDestination(for: Pokemon.self) { poke in
                    PokeDetailView(pokeInfo: poke)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
