// PokeCardViewModel.swift
// 
// 
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github	  @heyjaywilson
//               website  cctplus.dev

import Foundation
import SwiftUI
import PokeApiService
import Utilities

class PokeCardViewModel: ObservableObject {
    @Published var color: Color = .gray
    @Published var image: Image? = nil

    let apiService = PokeApiService.shared

    func setSpeciesInfo(for species: NamedAPIResource) async {
        let result = await apiService.getSpecies(for: species.name)

        switch result {
        case .success(let success):
            await setColor(name: success.color.name)
        case .failure(let failure):
            print("PokeCardViewModel.setSpecies(name:): \(failure.localizedDescription)")
        }
    }

    func setColor(name: String) async {
        let result = await apiService.getColor(for: name)

        switch result {
        case .success(let pokeColor):
            Task { @MainActor in
                color = ColorMap(name: pokeColor.name).colorMap()
            }
        case .failure(let failure):
            print("PokeCardViewModel.setColor(name:): \(failure.localizedDescription)")
        }
    }

    func image(from sprites: PokemonSprites) -> URL? {
        guard let frontImage = sprites.front_default else {
            print("\(sprites)")
            return nil
        }

        return URL(string: frontImage)
    }
}
