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
    case pokemon
    case ability

    var endpoint: String { self.rawValue }
}
