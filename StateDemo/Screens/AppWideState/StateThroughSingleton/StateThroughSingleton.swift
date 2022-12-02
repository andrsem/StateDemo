//
//  StateThroughSingleton.swift
//  StateDemo
//
//  Created by Andrii Sem on 01.12.2022.
//

import SwiftUI

struct StateThroughSingleton: View {
    var body: some View {
        VStack(spacing: 10) {
            CharacterView5()
            CharacterChanger5()
            DroidView5()
            DroidChanger5()
        }
        .updateCharacterManager()
    }
}

private struct CharacterView5: View {
    @Environment(\.characterConfig.character) var character
    @Environment(\.characterConfig.gradient) var gradient
    // Bad approach. Pass only data which view needs
    //    @Environment(\.characterConfig) var config

    var body: some View {
        print("in CharacterView body")
        return VStack {
//            Text(config.character)
            Text(character)
                .frame(width: 300)
                .padding()
//                .background { Gradient(gradient: config.gradient) }
                .background { Gradient(gradient: gradient) }
                .cornerRadius(12)
        }
        .font(.largeTitle)
    }
}

private struct CharacterChanger5: View {
    var body: some View {
        print("in CharacterChanger body")

        return Button("Change character") { CharacterManager5.shared.changeCharacter() }
    }
}

private struct DroidView5: View {
    @Environment(\.characterConfig.droid) var droid

    var body: some View {
        print("in DroidView body")
        return VStack {
            Text(droid)
        }
        .font(.largeTitle)
    }
}

private struct DroidChanger5: View {
    var body: some View {
        print("in DroidChanger body")
        return Button("Replace droid", action: CharacterManager5.shared.replaceDroid)
    }
}

struct StateThroughSingleton_Previews: PreviewProvider {
    static var previews: some View {
        StateThroughSingleton()
    }
}
