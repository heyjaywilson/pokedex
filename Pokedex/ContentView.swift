//
//  ContentView.swift
//  Pokedex
//
//  Created by Maegan Wilson on 11/18/22.
//

import SwiftUI
import SFSafeSymbols

struct PokeCardInfo: Identifiable, Hashable {
    var id: Int
    var name: String
    var pokeType: [String]
    var image = Image(systemSymbol: .pawprint)
    var color: Color

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

let pokemonDataSet = [
    PokeCardInfo(id: 1, name: "bulbasaur", pokeType: ["grass", "poison"], color: .green),
    PokeCardInfo(id: 2, name: "ivysaur", pokeType: ["grass", "poison"], color: .green),
    PokeCardInfo(id: 3, name: "venusaur", pokeType: ["grass", "poison"], color: .green),
    PokeCardInfo(id: 4, name: "charmander", pokeType: ["fire"], color: .red),
    PokeCardInfo(id: 25, name: "Pikachu", pokeType: ["Electric"], color: .yellow)
]

struct ContentView: View {
    let gridItems = [GridItem(spacing: 10), GridItem(spacing: 10)]

    @State private var pokemon: [PokeCardInfo] = []

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 10) {
                    ForEach(pokemonDataSet) { set in
                        NavigationLink(value: set) {
                            PokeCard(
                                name: set.name,
                                pTypes: set.pokeType,
                                color: set.color,
                                pImage: set.image)
                        }.foregroundColor(.primary)
                    }.frame(height: 150)
                }
            }.navigationTitle(Text("Pokedex"))
                .navigationBarTitleDisplayMode(.large)
                .padding()
                .navigationDestination(for: PokeCardInfo.self) { poke in
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
