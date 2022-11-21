// PokemonType.swift
// 
// 
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github	  @heyjaywilson
//               website  cctplus.dev

import Foundation

public struct PokemonType: Hashable, Equatable, Codable {
    public static func == (lhs: PokemonType, rhs: PokemonType) -> Bool {
        lhs.slot == rhs.slot
    }

    public var slot: Int
    public var type: NamedAPIResource

    public func hash(into hasher: inout Hasher) {
        hasher.combine(slot)
    }

}
