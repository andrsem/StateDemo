//
//  MockData.swift
//  StateDemo
//
//  Created by Andrii Sem on 01.12.2022.
//

import SwiftUI

enum MockData {
    static let characters = ["Obi-Wan", "Leia", "Boba Fett", "Andor", "Luke", "Han"]
    static let droids = ["R2-D2", "C-3PO", "BD-1", "BB-8"]
    static let colors: [Color] = [.orange, .indigo, .pink, .mint, .cyan, .red, .green]

    static func getRandomCharacter() -> String { characters.randomElement()! }
    static func getRandomDroid() -> String { droids.randomElement()! }
    static func getRandomColor() -> Color { colors.randomElement()! }
}
