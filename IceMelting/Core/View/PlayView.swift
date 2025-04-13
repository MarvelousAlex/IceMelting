//
//  PlayView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 28/3/2025.
//

import SwiftUI

struct PlayView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack {
            switch selectedTab {
            case 0: MatchView()
            case 1: InsightView()
            case 2: MessageView()
            default: ProfileView()
            }
            
            CustomTabBar(selectedTab: $selectedTab)
                .padding(.top, 700)
        }
        .navigationBarBackButtonHidden()
//        .ignoresSafeArea()
    }
}

#Preview {
    PlayView()
}
