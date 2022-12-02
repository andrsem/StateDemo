//
//  LocalStateReadOnly.swift
//  StateDemo
//
//  Created by Andrii Sem on 30.11.2022.
//

import SwiftUI

struct LocalStateReadOnly: View {
    @State private var character = MockData.characters[2]

    var body: some View {
        VStack {
            CharacterAndCompanion(name: character)
            Button("Change character") { character = MockData.getRandomCharacter() }
                .font(.title)
        }
    }
}

private struct CharacterAndCompanion: View {
    let name: String

    var body: some View {
        Text("**\(name)** with **\(MockData.droids[2])**")
            .font(.largeTitle)
    }
}

struct LocalStateReadOnly_Previews: PreviewProvider {
    static var previews: some View {
        LocalStateReadOnly()
    }
}
