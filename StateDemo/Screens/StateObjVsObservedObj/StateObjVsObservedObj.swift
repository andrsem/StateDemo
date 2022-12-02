//
//  StateObjVsObservedObj.swift
//  StateDemo
//
//  Created by Andrii Sem on 01.12.2022.
//

import SwiftUI

final class ColorManager: ObservableObject {
    @Published var color = Color.gray

    func changeColor() { color = MockData.getRandomColor() }
}

struct StateObjVsObservedObj: View {
    @State var currentDroid = MockData.droids.last!

    var body: some View {
        VStack {
            PaintDroidView(droid: currentDroid)
            Text("Current droid is: \(currentDroid)")
                .font(.title)
            Button("Change droid") { currentDroid = MockData.getRandomDroid() }
                .buttonStyle(.bordered)
                .tint(.red)
                .font(.title)
        }
    }
}

struct PaintDroidView: View {
    let droid: String
    // @StateObject property wrapper doesn’t get destroyed and re-instantiated at times their containing view struct redraws.
//    @StateObject
    @ObservedObject
    private var colorManager = ColorManager()

    private var currentDroid: String {
        switch droid {
        case "BB-8": return "sensor.tag.radiowaves.forward"
        case "R2-D2": return "sensor.fill"
        case "BD-1": return "light.strip.2"
        default: return "person.fill.turn.right"
        }
    }

    var body: some View {
        VStack(spacing: 50) {
            Image(systemName: currentDroid)
                .font(.custom("", size: 150))
                .rotationEffect(.degrees(-90))
                .foregroundColor(colorManager.color)

            Button("Paint Droid") { colorManager.changeColor() }
                .buttonStyle(.borderedProminent)
                .tint(colorManager.color)
                .font(.largeTitle)
        }
    }
}

struct StateObjVsObservedObj_Previews: PreviewProvider {
    static var previews: some View {
        StateObjVsObservedObj()
    }
}
