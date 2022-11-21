// File.swift
// 
// 
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github	  @heyjaywilson
//               website  cctplus.dev

import Foundation

enum PokeEndpoint: String {
    case ability
    case pokemon
    case pokemonColor = "pokemon-color"
    case pokemonSpecies = "pokemon-species"

    var endpoint: String { self.rawValue }
}
