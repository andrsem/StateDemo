//
//  GlobalStateGoodApproach.swift
//  StateDemo
//
//  Created by Andrii Sem on 30.11.2022.
//

import SwiftUI

final class CharacterManager3: ObservableObject {
    @Published var character = MockData.characters.first!
    @Published var droid = MockData.droids.first!
    @Published var gradient = MockData.colors

    func replaceDroid() { droid = MockData.getRandomDroid() }
    func changeCharacter() {
        character = MockData.getRandomCharacter()
        gradient = (0 ..< 4).map { _ in MockData.getRandomColor() }
    }
}

struct GlobalStateGoodApproach: View {
    @StateObject private var charManger = CharacterManager3()

    var body: some View {
        // @self means that the struct itself was changed
        // @identity means that the view identity has changed
        Self._printChanges()
        return VStack(spacing: 10) {
            CharacterView3(character: charManger.character, gradient: charManger.gradient)
            CharacterChanger3(action: charManger.changeCharacter)
            DroidView3(droid: charManger.droid)
            DroidChanger3(action: charManger.replaceDroid)
        }
    }
}

private struct CharacterView3: View {
    let character: String
    let gradient: [Color]

    var body: some View {
        print("in CharacterView3 body")
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

private struct CharacterChanger3: View {
    let action: () -> Void

    var body: some View {
        print("in CharacterChanger3 body")
        return Button("Change character") { action() }
    }
}

private struct DroidView3: View {
    let droid: String

    var body: some View {
        print("in DroidView3 body")
        return VStack {
            Text(droid)
        }
        .font(.largeTitle)
    }
}

private struct DroidChanger3: View {
    let action: () -> Void

    var body: some View {
        print("in DroidChanger3 body")
        return Button("Replace droid", action: action)
    }
}

struct GlobalStateBetterApproach_Previews: PreviewProvider {
    static var previews: some View {
        GlobalStateGoodApproach()
    }
}
