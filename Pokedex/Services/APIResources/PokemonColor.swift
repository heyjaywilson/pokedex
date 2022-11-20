// PokemonColor.swift
// Pokedex
// Copyright © 2022 CCT Plus LLC. All rights reserved.
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github	  @heyjaywilson
//               website  cctplus.dev

import Foundation

struct PokemonColor: Codable {
    var id: Int
    var name: String
    var names: Name
    var pokemonSpecies: NamedAPIResource

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case names
        case pokemonSpecies = "pokemon_species"
    }
}
