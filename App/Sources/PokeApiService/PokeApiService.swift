// PokeApiService.swift
// 
// 
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github	  @heyjaywilson
//               website  cctplus.dev

import Foundation
import Alamofire

public class PokeApiService {
    private var baseURL = "https://pokeapi.co/api/v2/"

    public func getPokemonList() async -> Result<PokemonList, AFError> {
        let request = AF.request(baseURL+PokeEndpoint.pokemon.endpoint)
        let result = await request.serializingDecodable(PokemonList.self).result

        return result
    }

    public func getPokemon(from list: PokemonList) async -> [Pokemon] {
        var tempPokemon: [Pokemon] = []
        for result in list.results {
            let pokemonResult = await getPokemon(from: result.url)

            switch pokemonResult {
            case .success(let pokemon):
                tempPokemon.append(pokemon)
            case .failure(let failure):
                print("PokeApiService.getPokemon(): \(failure)")
            }
        }
        return tempPokemon
    }

    public func getPokemon(from url: String) async -> Result<Pokemon, AFError> {
        let request = AF.request(url)
        let result = await request.serializingDecodable(Pokemon.self).result

        return result
    }
}
