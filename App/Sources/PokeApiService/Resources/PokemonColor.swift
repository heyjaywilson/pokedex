// PokemonColor.swift
// 
// 
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github	  @heyjaywilson
//               website  cctplus.dev

import Foundation

public struct PokemonColor: Codable {
    public var id: Int
    public var name: String
    public var names: [Name]
    public var pokemonSpecies: [NamedAPIResource]

    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case names
        case pokemonSpecies = "pokemon_species"
    }
}
