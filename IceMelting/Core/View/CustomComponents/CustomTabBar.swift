//
//  CustomTabBar.swift
//  IceMelting
//
//  Created by Wendy Zhou on 8/4/2025.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int

    var body: some View {
        HStack(spacing: 0) {
            Button(action: { selectedTab = 0 }) {
                VStack(spacing: 0) {
                    Image("Profilee")
                        .renderingMode(.template)
                    Text("Profile")
                }
                .foregroundStyle(selectedTab == 0 ? Color.pinkk : Color.white)
            }
            .frame(maxWidth: .infinity)
            
            Button(action: { selectedTab = 1 }) {
                VStack(spacing: 0) {
                    Image("HandShake")
                        .renderingMode(.template)
                    Text("Match")
                }
                .foregroundStyle(selectedTab == 1 ? Color.pinkk : Color.white)
            }
            .frame(maxWidth: .infinity)
            
            Button(action: { selectedTab = 2 }) {
                VStack(spacing: 0) {
                    Image("Bulbb")
                        .renderingMode(.template)
                    Text("Insight")
                }
                .foregroundStyle(selectedTab == 2 ? Color.pinkk : Color.white)
            }
            .frame(maxWidth: .infinity)
            
            Button(action: { selectedTab = 3 }) {
                VStack(spacing: 0) {
                    Image("Messagee")
                        .renderingMode(.template)
                    Text("Message")
                }
                .foregroundStyle(selectedTab == 3 ? Color.pinkk : Color.white)
            }
            .frame(maxWidth: .infinity)
        }
        .font(.custom("K2D-SemiBold", size: 15))
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 360, height: 60)
                .foregroundStyle(Color.black)
        }
        .shadow(radius: 2)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(0))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
