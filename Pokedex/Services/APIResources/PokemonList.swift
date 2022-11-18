//
//  Pokemon.swift
//  Pokedex
//
//  Created by Maegan Wilson on 11/18/22.
//

import Foundation

struct PokemonList: Codable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [NamedAPIResource]
}
