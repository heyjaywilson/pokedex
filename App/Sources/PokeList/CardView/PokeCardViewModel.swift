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
                switch pokeColor.name {
                case "black":
                    color = .black
                case "blue":
                    color = .blue
                case "brown":
                    color = .brown
                case "green":
                    color = .green
                case "yellow":
                    color = .yellow
                case "red":
                    color = .red
                case "white":
                    color = .white
                case "purple":
                    color = .purple
                default:
                    print("COLOR: \(pokeColor.name)")
                    color = .gray
                }
            }
        case .failure(let failure):
            print("PokeCardViewModel.setColor(name:): \(failure.localizedDescription)")
        }
    }
}
