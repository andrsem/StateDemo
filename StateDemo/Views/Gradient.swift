//
//  Gradient.swift
//  StateDemo
//
//  Created by Andrii Sem on 01.12.2022.
//

import SwiftUI

struct Gradient: View {
    let gradient: [Color]

    var body: some View {
        RadialGradient(
            colors: gradient,
            center: .center,
            startRadius: 0,
            endRadius: 180
        )
        .opacity(0.3)
    }
}

struct Gradient_Previews: PreviewProvider {
    static var previews: some View {
        Gradient(gradient: MockData.colors)
    }
}
