//
//  LocalStateReadAndWriteWithNavigation.swift
//  StateDemo
//
//  Created by Andrii Sem on 30.11.2022.
//

import SwiftUI

struct LocalStateReadAndWriteWithNavigation: View {
    @State private var character = MockData.characters[4]
    @State private var droid = MockData.droids.last!

    var body: some View {
        VStack {
            Text("**\(character)** with **\(droid)**")
                .font(.largeTitle)
            NameChanger2(character: $character)
            NavigationLink {
                DroidChanger(droid: $droid)
            } label: {
                HStack {
                    Text("Go and change droid")
                    Image(systemName: "dpad.right.filled")
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

private struct NameChanger2: View {
    @Binding var character: String

    var body: some View {
        Button("Change character") {
            character = MockData.getRandomCharacter()
        }
    }
}

private struct DroidChanger: View {
    @Binding var droid: String
    @State private var color = Color.indigo

    var body: some View {
        ZStack {
            color
                .opacity(0.2)
                .ignoresSafeArea()

            VStack {
                Text("Current droid: **\(droid)**")
                    .font(.largeTitle)
                Button("Replace Droid") {
                    droid = MockData.getRandomDroid()
                    color = MockData.getRandomColor()
                }
                .buttonStyle(.borderedProminent)
                .tint(.orange)
            }
        }
    }
}

struct LocalStateReadAndWriteWithNavigation_Previews: PreviewProvider {
    static var previews: some View {
        LocalStateReadAndWriteWithNavigation()
    }
}
