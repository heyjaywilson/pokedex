// PokemonList.swift
// 
// 
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github	  @heyjaywilson
//               website  cctplus.dev

import Foundation

public struct PokemonList: Codable {
    public var count: Int?
    public var next: String?
    public var previous: String?
    public var results: [NamedAPIResource]
}
