// PokemonSpecies.swift
// 
// 
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github	  @heyjaywilson
//               website  cctplus.dev

import Foundation

public struct PokemonSpecies: Codable {
    public var id: Int
    public var name: String
    public var color: NamedAPIResource

    public enum CodingKeys: CodingKey {
        case id
        case name
        case color
    }
}
