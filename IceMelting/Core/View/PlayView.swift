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
    @State private var selectedUser: Users? = nil

    var body: some View {
        ZStack {
            switch selectedTab {
            case 0: ProfileView()
            case 1:
                if let user = selectedUser {
                    UserDetailView(user: user)
                } else {
                    MatchView(onUserSelected: { user in
                        selectedUser = user
                    })
                }
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
