//
//  GlobalStateBadApproach.swift
//  StateDemo
//
//  Created by Andrii Sem on 30.11.2022.
//

import SwiftUI

final class CharacterManager: ObservableObject {
    @Published var character = MockData.characters.first!
    @Published var droid = MockData.droids.first!

    func replaceDroid() { droid = MockData.getRandomDroid() }
    func changeCharacter() { character = MockData.getRandomCharacter() }
}

struct GlobalStateBadApproach: View {
    @StateObject private var charManager = CharacterManager()

    var body: some View {
        // @self means that the struct itself was changed
        // @identity means that the view identity has changed
        Self._printChanges()
        return VStack(spacing: 40) {
            CharacterView(characterManager: charManager)
            DroidView(characterManager: charManager)
        }
    }
}

private struct CharacterView: View {
    @ObservedObject var characterManager: CharacterManager

    var body: some View {
        print("in CharacterView body")

        return VStack {
            Text(characterManager.character)
                .padding()
                .background { MockData.getRandomColor() }
                .cornerRadius(12)
            Button("Change character", action: characterManager.changeCharacter)
        }
        .font(.largeTitle)
    }
}

private struct DroidView: View {
    @ObservedObject var characterManager: CharacterManager

    var body: some View {
        print("in DroidView body")
        return VStack {
            Text(characterManager.droid)
            Button("Replace droid", action: characterManager.replaceDroid)
        }
        .font(.largeTitle)
    }
}

struct GlobalStateBadApproach_Previews: PreviewProvider {
    static var previews: some View {
        GlobalStateBadApproach()
    }
}
