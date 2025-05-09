//
//  GreatAnswerView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 16/4/2025.
//

import SwiftUI

struct GreatAnswerView: View { 
    @State private var textOpacity: Double = 0.0
    @State private var textHight: Double = 100.0
    
    // New states for the second text:
    @State private var secondTextOpacity: Double = 0.0
    @State private var secondTextHight: Double = 350.0

    @State private var navigateToQuestionView2: Bool = false
    
    var body: some View {
        ZStack {
            Color.skinn.ignoresSafeArea()
            Image("GreatAns")
            
            VStack(spacing: 20) {
                Text("Great Answer👍🏻")
                    .font(.custom("K2D-Bold", size: 45))
                    .foregroundStyle(Color.black)
                    .offset(y: textHight)
                    .opacity(textOpacity)
                    .onAppear {
                        withAnimation(.spring(duration: 2)) {
                            textOpacity = 1.0
                            textHight = 0
                        }
                    }
                Text("Waiting for the results...")
                    .font(.custom("K2D-Bold", size: 20))
                    .foregroundStyle(Color.black)
                    .offset(y: secondTextHight)
                    .opacity(secondTextOpacity)
                    .onAppear {
                        withAnimation(.spring(duration: 2).delay(0.5)) {
                            secondTextOpacity = 1.0
                            secondTextHight = 100
                        }
                    }
            }
        }
        .onAppear {
            // Calculate total animation duration (here: delay (0.5) + animation duration (2.0) )
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                navigateToQuestionView2 = true
            }
        }
        .navigationDestination(isPresented: $navigateToQuestionView2) {
            SumView1()
        }
    }
}

#Preview {
    NavigationStack {
        GreatAnswerView()
    }
}
