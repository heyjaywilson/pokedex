// ColorMap.swift
// 
// 
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github	  @heyjaywilson
//               website  cctplus.dev

import Foundation
import SwiftUI

public struct ColorMap {
    private var name: String

    public init(name: String) {
        self.name = name
    }

    public func colorMap() -> Color {
        var color: Color = .gray
        switch name {
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
            print("COLOR NOT FOUND: \(name)")
            color = .gray
        }
        return color
    }
}
