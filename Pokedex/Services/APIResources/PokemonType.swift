// PokemonType.swift
// Pokedex
// Copyright © 2022 CCT Plus LLC. All rights reserved.
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github	  @heyjaywilson
//               website  cctplus.dev

import Foundation

struct PokemonType: Hashable, Equatable, Codable {
    static func == (lhs: PokemonType, rhs: PokemonType) -> Bool {
        lhs.slot == rhs.slot
    }

    var slot: Int
    var type: NamedAPIResource

    func hash(into hasher: inout Hasher) {
        hasher.combine(slot)
    }

}
