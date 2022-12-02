//
//  GlobalStateNotGreatApproach.swift
//  StateDemo
//
//  Created by Andrii Sem on 30.11.2022.
//

import SwiftUI

final class CharacterManager2: ObservableObject {
    @Published var character = MockData.characters.first!
    @Published var droid = MockData.droids.first!
    @Published var gradient = MockData.colors

    func replaceDroid() { droid = MockData.getRandomDroid() }
    func changeCharacter() {
        character = MockData.getRandomCharacter()
        gradient = (0 ..< 4).map { _ in MockData.getRandomColor() }
    }
}

struct GlobalStateNotGreatApproach: View {
    @StateObject private var charManager = CharacterManager2()

    var body: some View {
        // @self means that the struct itself was changed
        // @identity means that the view identity has changed
        Self._printChanges()
        return VStack(spacing: 10) {
            CharacterView2(character: charManager.character, gradient: charManager.gradient)
            CharacterChanger2(charManager: charManager)
            DroidView2(droid: charManager.droid)
            DroidChanger2(charManager: charManager)
        }
    }
}

struct CharacterView2: View {
    let character: String
    let gradient: [Color]

    var body: some View {
        print("in CharacterView2 body")
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

struct CharacterChanger2: View {
    @ObservedObject var charManager: CharacterManager2

    var body: some View {
        print("in CharacterChanger2 body")
        return Button("Change character") { charManager.changeCharacter() }
    }
}

private struct DroidView2: View {
    let droid: String

    var body: some View {
        print("in DroidView2 body")
        return VStack {
            Text(droid)
        }
        .font(.largeTitle)
    }
}

private struct DroidChanger2: View {
    @ObservedObject var charManager: CharacterManager2

    var body: some View {
        print("in DroidChanger2 body")
        return Button("Replace droid", action: charManager.replaceDroid)
    }
}

struct GlobalStateNotGreatApproach_Previews: PreviewProvider {
    static var previews: some View {
        GlobalStateNotGreatApproach()
    }
}
