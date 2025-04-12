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
                    Text("Profile")
                        .foregroundStyle(Color.white)
                }
            }
            .frame(maxWidth: .infinity)
            
            Button(action: { selectedTab = 1 }) {
                VStack(spacing: 0) {
                    Image("HandShake")
                    Text("Match")
                        .foregroundStyle(Color.white)
                }
            }
            .frame(maxWidth: .infinity)
            
            Button(action: { selectedTab = 2 }) {
                VStack(spacing: 0) {
                    Image("Bulbb")
                    Text("Insight")
                        .foregroundStyle(Color.white)
                }
            }
            .frame(maxWidth: .infinity)
            
            Button(action: { selectedTab = 3 }) {
                VStack(spacing: 0) {
                    Image("Messagee")
                    Text("Message")
                        .foregroundStyle(Color.white)
                }
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
