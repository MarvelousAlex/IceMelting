//
//  AppEggView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 12/4/2025.
//

import SwiftUI

struct AppEggView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.skinn.ignoresSafeArea()
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        NavigationLink {
                            AppLoadingPage()
                        } label: {
                            Image("AppIconImage")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .offset(x: -20)
                        }
                        Text("").font(.system(size: 100))
                    }
                    Text("Congratulations🏁")
                        .font(.custom("Nunito-Bold", size: 40))
                    Text("🤩You have found the egg🥚")
                        .font(.custom("Nunito-Bold", size: 25))
                    Divider()
                        .padding(20)
                    Text("Project Contributer:👍🏻")
                        .font(.custom("Nunito-Bold", size: 22))
                    Text("Yun Chao - UI/UX Designer")
                    Text("Chien-Yuan Chu - Project Coordinator")
                    Text("Abdulrhman Fahad A Alorini")
                    Text("Wende Zhou - App Developer")
                    Spacer()
                }
                .font(.custom("Nunito-Regular", size: 20))
                .padding()
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    AppEggView()
}
