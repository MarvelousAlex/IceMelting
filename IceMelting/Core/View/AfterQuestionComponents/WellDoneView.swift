//
//  WellDoneView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 23/4/2025.
//

import SwiftUI

struct WellDoneView: View {
    
    @State private var textSize: Double = 0
    @State private var secondtextSize: Double = 0
    @State private var secondTextOpacity: Double = 0
    @State private var ImageOpacity: Double = 0
    @State private var ButtonOpacity: Double = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.skinYellow.ignoresSafeArea()
                Image("WellDone")
                    .opacity(ImageOpacity)
                    .onAppear {
                        withAnimation(.spring(duration: 1)) {
                            ImageOpacity = 1
                        }
                    }
                VStack(spacing: 10) {
                     
                    Spacer()
                    
                    WellDoneText
                    
                    matchCaption
                    
                    Spacer()
                    
                    navButton
                    
                }
            }
        }
    }
}

#Preview {
    WellDoneView()
}

extension WellDoneView {
    private var WellDoneText: some View {
        Text("Well Done!")
            .foregroundStyle(Color.black)
            .font(.custom("K2D-Bold", size: textSize))
            .onAppear {
                withAnimation(.spring(duration: 1).delay(0.5)) {
                    textSize = 60
//                                firstTextOpacity = 1
                }
            }
    }
    
    private var matchCaption: some View {
        Text("Now, start to find your match.")
            .foregroundStyle(Color.black)
            .font(.custom("K2D-Regular", size: 20))
            .opacity(secondTextOpacity)
            .onAppear {
                withAnimation(.spring(duration: 2).delay(1.7)) {
                    secondTextOpacity = 1.0
                }
            }
    }
    
    private var navButton: some View {
        NavigationLink {
            UserListView()
        } label: {
            Text("Find Your Match")
                .font(.custom("K2D-SemiBold", size: 20))
                .foregroundStyle(Color.white)
                .background {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(Color.shineRed)
                        .frame(width: 360, height: 60)
                }
        }
        .opacity(ButtonOpacity)
        .onAppear {
            withAnimation(.spring(duration: 1).delay(2)) {
                ButtonOpacity = 1
            }
        }
    }
}
