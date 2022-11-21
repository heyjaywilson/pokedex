//
//  ContentView.swift
//  Pokedex
//
//  Created by Maegan Wilson on 11/18/22.
//

import SwiftUI
import SFSafeSymbols
import PokeApiService
import PokeList

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

    var body: some View {
        PokeList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
