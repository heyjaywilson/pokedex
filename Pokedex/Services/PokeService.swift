//
//  PokeService.swift
//  Pokedex
//
//  Created by Maegan Wilson on 11/18/22.
//

import Foundation
import Alamofire

enum PokeApi: String {
    case pokemon = "pokemon"
    case ability = "ability"

    var endPoint: String { self.rawValue }
}

class PokeService {
    private var baseURL = "https://pokeapi.co/api/v2/"

    /// Gets first 20 pokemon
    func getPokemon() async -> [Pokemon] {
        let request = AF.request(baseURL+PokeApi.pokemon.endPoint)
        let response = await request.serializingDecodable(PokemonList.self).response
        let results = response.value!

        var pokemons: [Pokemon] = []
        for poke in results.results {
            let poke = await getPokemonFrom(url: poke.url)
            pokemons.append(poke)
        }

        return pokemons
    }

    func getPokemonFrom(url: String) async -> Pokemon {
        let request = AF.request(url)
        let response = await request.serializingDecodable(Pokemon.self).response
        return response.value!
    }
}
