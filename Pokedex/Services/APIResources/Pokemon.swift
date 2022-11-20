// Pokemon.swift
// Pokedex
// Copyright © 2022 CCT Plus LLC. All rights reserved.
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github   @heyjaywilson
//               website  cctplus.dev

import Foundation

struct Pokemon: Codable, Hashable, Identifiable {
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        lhs.id == rhs.id
    }

    var id: Int
    var name: String
    var baseExperience: Int
    var pTypes: [PokemonType]
    var sprites: PokemonSprites

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case baseExperience = "base_experience"
        case pTypes = "types"
        case sprites
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
