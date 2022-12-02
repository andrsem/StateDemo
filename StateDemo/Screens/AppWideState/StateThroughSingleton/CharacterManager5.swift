//
//  CharacterManager5.swift
//  StateDemo
//
//  Created by Andrii Sem on 01.12.2022.
//

import Foundation
import SwiftUI

// MARK: State

struct CharacterConfig {
    var character = MockData.characters.first!
    var droid = MockData.droids.first!
    var gradient = MockData.colors
}

final class CharacterManager5: ObservableObject {
    @Published var state = CharacterConfig()

    func replaceDroid() { state.droid = MockData.getRandomDroid() }
    func changeCharacter() {
        state.character = MockData.getRandomCharacter()
        state.gradient = (0 ..< 4).map { _ in MockData.getRandomColor() }
    }

    static var shared = CharacterManager5()
    private init() {}
}

// MARK: - set Environment value

private struct CharacterKey: EnvironmentKey {
    static var defaultValue = CharacterManager5.shared.state
}

extension EnvironmentValues {
    var characterConfig: CharacterConfig {
        get { self[CharacterKey.self] }
        set { self[CharacterKey.self] = newValue }
    }
}

// MARK: - Update Environment Value

private struct CharacterModifier: ViewModifier {
    @ObservedObject var characterManager = CharacterManager5.shared

    func body(content: Content) -> some View {
        content.environment(\.characterConfig, characterManager.state)
    }
}

extension View {
    func updateCharacterManager() -> some View {
        modifier(CharacterModifier())
    }
}
