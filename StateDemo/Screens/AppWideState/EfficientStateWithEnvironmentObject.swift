//
//  StateWithEnvironmentObjectEfficient.swift
//  StateDemo
//
//  Created by Andrii Sem on 01.12.2022.
//

import SwiftUI

final class CharacterManager6: ObservableObject {
    @Published var character = MockData.characters.first!
    @Published var droid = MockData.droids.first!
    @Published var gradient = MockData.colors

    func replaceDroid() { droid = MockData.getRandomDroid() }
    func changeCharacter() {
        character = MockData.getRandomCharacter()
        gradient = (0 ..< 4).map { _ in MockData.getRandomColor() }
    }
}

struct EfficientStateWithEnvironmentObject: View {
    @StateObject private var charManger = CharacterManager6()

    var body: some View {
        SomeViewHierarchy()
            .environmentObject(charManger)
    }
}

private struct SomeViewHierarchy: View {
    var body: some View {
        InternalView()
    }
}

private struct InternalView: View {
    @EnvironmentObject private var charManger: CharacterManager6
    var body: some View {
        VStack(spacing: 10) {
            CharacterView6(character: charManger.character, gradient: charManger.gradient)
            CharacterChanger6(action: charManger.changeCharacter)
            DroidView6(droid: charManger.droid)
            DroidChanger6(action: charManger.replaceDroid)
        }
    }
}

private struct CharacterView6: View {
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

private struct CharacterChanger6: View {
    let action: () -> Void

    var body: some View {
        print("in CharacterChanger body")
        return Button("Change character") { action() }
    }
}

private struct DroidView6: View {
    let droid: String

    var body: some View {
        print("in DroidView body")
        return
            Text(droid)
                .font(.largeTitle)
    }
}

private struct DroidChanger6: View {
    let action: () -> Void

    var body: some View {
        print("in DroidChanger body")
        return Button("Replace droid", action: action)
    }
}

struct StateWithEnvironmentObjectEfficient_Previews: PreviewProvider {
    static var previews: some View {
        EfficientStateWithEnvironmentObject().environmentObject(CharacterManager6())
    }
}
