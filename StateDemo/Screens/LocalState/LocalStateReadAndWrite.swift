//
//  LocalStateReadAndWrite.swift
//  StateDemo
//
//  Created by Andrii Sem on 30.11.2022.
//

import SwiftUI

struct LocalStateReadAndWrite: View {
    @State private var character = MockData.characters[4]

    var body: some View {
        VStack {
            Text("**\(character)** with **\(MockData.droids[1])**")
                .font(.largeTitle)
            NameChanger(character: $character)
        }
    }
}

private struct NameChanger: View {
    @Binding var character: String

    var body: some View {
        VStack {
            Button("Change character") { character = MockData.getRandomCharacter() }
                .font(.title)

            Text("Current character - **\(character)**")
        }
    }
}

struct LocalStateReadAndWrite_Previews: PreviewProvider {
    static var previews: some View {
        LocalStateReadAndWrite()
    }
}
