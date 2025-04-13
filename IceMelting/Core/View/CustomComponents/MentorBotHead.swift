//
//  MentorBotHead.swift
//  IceMelting
//
//  Created by Wendy Zhou on 11/4/2025.
//

import SwiftUI

struct MentorBotHead: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 300, height: 300)
                .foregroundStyle(Color.blue)
            VStack(spacing: 70) {
                CircleView()
                TeethView()
            }
        }
    }
}

#Preview {
    MentorBotHead()
}

struct CircleView: View {
    var body: some View {
        HStack(spacing: 60) {
            ForEach(0..<2) { _ in
                Circle()
                    .fill(Color.black)
                    .frame(width: 40, height: 40)
            }
            .background {
                ForEach(0..<2) { _ in
                    Circle()
                        .fill(Color.white)
                        .frame(width: 60, height: 60)
                }
            }
        }
    }
}

struct TeethView: View {
    var body: some View {
        HStack {
            ForEach(0..<5) { _ in
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 30, height: 30)
            }
        }
        .background {
            Rectangle()
                .frame(width: 200, height: 60)
        }
    }
}
