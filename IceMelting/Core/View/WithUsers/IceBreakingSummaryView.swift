//
//  IceBreakingSummaryView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 4/5/2025.
//

import SwiftUI

struct IceBreakingSummaryView: View {
    let greetings: [String: String] = [
        "Do you have any working experience?": "I've worked as a UX/UI designer for 2 years at a startup, and I also do freelance design work. Most of my experience is in mobile app interfaces and user research.",
        "Can you tell me about a challenging project you've worked on?": "One challenging project was redesigning our e‑commerce checkout flow to reduce cart abandonment. I led the user interviews, prototyped multiple versions, and collaborated with developers to implement the final design.",
        "What motivates you in your design work?": "I'm motivated by solving real user problems and creating intuitive, accessible interfaces. Seeing positive feedback from users makes all the effort worthwhile."
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 16) {
                ForEach(Array(greetings.keys), id: \.self) { question in
                    let answer = greetings[question] ?? ""
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.armyGreen)
                        VStack(alignment: .leading, spacing: 8) {
                            Text(question)
                                .font(.custom("K2D-Bold", size: 20))
                                .foregroundColor(.primary)
                                .padding(.horizontal, 12)
                                .padding(.top, 12)
                            Text(answer)
                                .multilineTextAlignment(.leading)
                                .font(.custom("K2D-Bold", size: 18))
                                .foregroundColor(.primary)
                                .padding()
                                .background{
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.white)
                                }
                                .padding(.horizontal, 12)
                                .padding(.bottom, 12)
                                .lineLimit(3)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    .frame(width: 300, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    IceBreakingSummaryView()
}
