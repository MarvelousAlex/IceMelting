//
//  AppLoadingPage.swift
//  IceMelting
//
//  Created by Wendy Zhou on 11/4/2025.
//

import SwiftUI

struct AppLoadingPage: View {
    
    @State private var goToAppEgg = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.pureWhite.ignoresSafeArea()
                VStack {
                    Image("AppIconImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 450*0.9, height: 480*0.9)
                        .onTapGesture(count: 2) {
                            goToAppEgg = true
                        }
                    
                    Spacer().frame(height: 90)
                    
                    NavigationLink(destination: PlayView()) {
                        StartingLabel
                    }.offset(y:90)
                }
            }
            .navigationBarBackButtonHidden()
            .navigationDestination(isPresented: $goToAppEgg) {
                AppEggView()
            }
        }
    }
}

#Preview {
    AppLoadingPage()
}

extension AppLoadingPage {
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
