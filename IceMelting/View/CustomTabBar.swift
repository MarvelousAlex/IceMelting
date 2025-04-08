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
        HStack {
            Button(action: { selectedTab = 0 }) {
                VStack {
                    Image("Profilee")
                    Text("Profile")
                }
            }
            .frame(maxWidth: .infinity)
            
            Button(action: { selectedTab = 1 }) {
                VStack {
                    Image("HandShake")
                    Text("Match")
                }
            }
            .frame(maxWidth: .infinity)
            
            Button(action: { selectedTab = 2 }) {
                VStack {
                    Image("Bulbb")
                    Text("Insight")
                }
            }
            .frame(maxWidth: .infinity)
            
            Button(action: { selectedTab = 3 }) {
                VStack {
                    Image("Messagee")
                    Text("Message")
                }
            }
            .frame(maxWidth: .infinity)
        }
        .foregroundStyle(Color.white)
        .font(.custom("Nunito-Regular", size: 18))
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 35)
                .frame(height: 90)
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
