//
//  PlayView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 28/3/2025.
//

import SwiftUI

struct PlayView: View {
    @State private var selectedTab = 1
    
    var body: some View {
        ZStack {
            switch selectedTab {
            case 0: ProfileView()
            case 1: MatchView()
            case 2: InsightView()
            case 3: MessageView()
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
