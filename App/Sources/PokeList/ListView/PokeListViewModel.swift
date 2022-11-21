// PokeListViewModel.swift
// 
// 
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github	  @heyjaywilson
//               website  cctplus.dev

import PokeApiService

import Foundation
import Combine

class PokeListViewModel: ObservableObject {
    @Published var pokemon: [Pokemon] = []
    @Published var previous: String? = nil
    @Published var next: String? = nil

    var pokeList: PokemonList? = nil

    var apiService = PokeApiService.shared

    func fetchPokemon() async {
        let result = await apiService.getPokemonList()
        do {
            let currentResults = try result.get()
            Task { @MainActor in
                previous = currentResults.previous
                next = currentResults.next
            }
            pokeList = currentResults
        } catch {
            print("PokeListViewModel.fetchPokemon(): \(error)")
        }

        guard let pokeList else {
            print("PokeListViewModel.fetchPokemon(): Error assigning pokeList")
            return
        }

        Task { @MainActor in
            pokemon = await apiService.getPokemon(from: pokeList)
        }
    }
}
