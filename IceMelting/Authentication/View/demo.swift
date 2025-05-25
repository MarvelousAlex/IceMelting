//
//  demo.swift
//  IceMelting
//
//  Created by Wendy Zhou on 17/5/2025.
//

import SwiftUI

struct demo: View {
    var body: some View {
        Image(systemName: "square.and.arrow.up")
            .resizable()
            .scaledToFit()
            .foregroundStyle(Color.yellow)
            .frame(width: 100, height: 100)
            .background {
//                Circle()
            }
    }
}

#Preview {
    demo()
}
