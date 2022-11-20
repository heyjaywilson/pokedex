// Pokemon.swift
// Pokedex
// Copyright © 2022 CCT Plus LLC. All rights reserved.
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github   @heyjaywilson
//               website  cctplus.dev

import Foundation

struct PokemonList: Codable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [NamedAPIResource]
}
