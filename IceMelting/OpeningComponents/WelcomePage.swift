//
//  WelcomePage.swift
//  IceMelting
//
//  Created by Wendy Zhou on 11/4/2025.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.pureWhite.ignoresSafeArea()
                
                Image("AppIconImage")
                    .resizable()
                    .frame(width: 450, height: 480)
                
                NavigationLink {
                    MainView()
                } label: {
                    StartingLabel
                }
                .padding(.top, 700)
            }
        }
    }
}

#Preview {
    WelcomePage()
}

extension WelcomePage {
    private var StartingLabel: some View {
        Text("ENTER")
            .font(.custom("K2D-SemiBold", size: 20))
            .foregroundStyle(Color.white)
            .background {
                RoundedRectangle(cornerRadius: 99)
                    .frame(width: 360, height: 60)
                    .foregroundStyle(Color.black)
            }
        
    }
}
