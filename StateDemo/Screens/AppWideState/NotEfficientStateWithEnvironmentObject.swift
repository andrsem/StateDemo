//
//  StateWithEnvironmentObject.swift
//  StateDemo
//
//  Created by Andrii Sem on 01.12.2022.
//

import SwiftUI

final class CharacterManager4: ObservableObject {
    @Published var character = MockData.characters.first!
    @Published var droid = MockData.droids.first!
    @Published var gradient = MockData.colors

    func replaceDroid() { droid = MockData.getRandomDroid() }
    func changeCharacter() {
        character = MockData.getRandomCharacter()
        gradient = (0 ..< 4).map { _ in MockData.getRandomColor() }
    }
}

struct NotEfficientStateWithEnvironmentObject: View {
    @StateObject private var charManager = CharacterManager4()

    var body: some View {
        // @self means that the struct itself was changed
        // @identity means that the view identity has changed
        Self._printChanges()
        return VStack(spacing: 10) {
            CharacterView4(character: charManager.character, gradient: charManager.gradient)
            CharacterChanger4()
            DroidView4(droid: charManager.droid)
            DroidChanger4()
        }
        .environmentObject(charManager)
    }
}

private struct CharacterView4: View {
    let character: String
    let gradient: [Color]

    var body: some View {
        print("in CharacterView body")
        return VStack {
            Text(character)
                .frame(width: 300)
                .padding()
                .background { Gradient(gradient: gradient) }
                .cornerRadius(12)
        }
        .font(.largeTitle)
    }
}

private struct CharacterChanger4: View {
    @EnvironmentObject private var charManager: CharacterManager4

    var body: some View {
        print("in CharacterChanger body")
        return Button("Change character") { charManager.changeCharacter() }
    }
}

private struct DroidView4: View {
    let droid: String

    var body: some View {
        print("in DroidView body")
        return VStack {
            Text(droid)
        }
        .font(.largeTitle)
    }
}

private struct DroidChanger4: View {
    @EnvironmentObject private var charManager: CharacterManager4

    var body: some View {
        print("in DroidChanger body")
        return Button("Replace droid", action: charManager.replaceDroid)
    }
}

struct StateWithEnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        NotEfficientStateWithEnvironmentObject()
    }
}
