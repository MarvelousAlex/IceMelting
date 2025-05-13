//
//  PlayView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 28/3/2025.
//
// This is also the main view for the app that for the main fnction

import SwiftUI

struct PlayView: View {
    @State private var selectedTab = 1
    var body: some View {
        ZStack {
            switch selectedTab {
            case 0: ProfileView()
            case 1: MatchView()
            case 2: InsightPageView()
            case 3: ChatView()
            default: ProfileView()
            }
            // MARK: - Custome tabbar with parameters
            CustomTabBar(selectedTab: $selectedTab)
                .offset(y: 360)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    PlayView()
}
