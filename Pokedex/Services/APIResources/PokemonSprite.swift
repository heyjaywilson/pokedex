// PokemonSprites.swift
// Pokedex
// Copyright © 2022 CCT Plus LLC. All rights reserved.
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github	  @heyjaywilson
//               website  cctplus.dev

import Foundation

struct PokemonSprites: Codable {
    var front_default: String?
    var front_shiny: String?
    var front_female: String?
    var front_shiny_female: String?
    var back_default: String?
    var back_shiny: String?
    var back_female: String?
    var back_shiny_female: String?
}
