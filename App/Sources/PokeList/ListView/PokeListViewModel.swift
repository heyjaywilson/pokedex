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
    var previous: String? = nil
    var next: String? = nil

    var pokeList: PokemonList? = nil

    var apiService = PokeApiService.shared

    func fetchPokemon() async {
        let result = await apiService.getPokemonList()
        do {
            let currentResults = try result.get()
            previous = currentResults.previous
            next = currentResults.next
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

    func loadMore() async {
        guard let next else {
            return
        }
        var nextPokeList: PokemonList? = nil

        let result = await apiService.getPokemonList(from: next)

        var shouldSkip = false

        do {
            let currentResults = try result.get()
            shouldSkip = currentResults.previous == previous
            previous = currentResults.previous
            self.next = currentResults.next
            nextPokeList = currentResults
        } catch {
            print("PokeListViewModel.loadMore(): \(error)")
        }

        if !shouldSkip {
            guard let nextPokeList else {
                return
            }

            let nextPokemon = await apiService.getPokemon(from: nextPokeList)

            Task { @MainActor in
                for poke in nextPokemon {
                    pokemon.append(poke)
                }
            }
        }
    }
}
