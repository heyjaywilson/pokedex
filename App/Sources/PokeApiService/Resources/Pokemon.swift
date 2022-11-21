// Pokemon.swift
// 
// 
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github	  @heyjaywilson
//               website  cctplus.dev

import Foundation

public struct Pokemon: Codable, Hashable, Identifiable {
    public static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        lhs.id == rhs.id
    }

    public var id: Int
    public var name: String
    public var baseExperience: Int
    public var pTypes: [PokemonType]
    public var species: NamedAPIResource
    public var sprites: PokemonSprites

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case baseExperience = "base_experience"
        case pTypes = "types"
        case sprites
        case species
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
