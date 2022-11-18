//
//  Pokemon.swift
//  Pokedex
//
//  Created by Maegan Wilson on 11/18/22.
//

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

struct Pokemon: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var baseExperience: Int
    var pTypes: [PokemonType]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case baseExperience = "base_experience"
        case pTypes = "types"
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
