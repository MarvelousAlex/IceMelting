//
//  UserListView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 22/4/2025.
//

import SwiftUI

struct UserListView: View {

//    let user: Users
    @StateObject private var viewModel = UsersViewModel()
    @State private var selectedTab = 1
    @State private var selectedUser: Users? = nil

    var body: some View {
        ZStack {
            switch selectedTab {
            case 0:
                ProfileView()
            case 1:
                NavigationStack {
                    ZStack {
                        Color.skinn.ignoresSafeArea()
                        ScrollView {
                            ForEach(viewModel.usersList) { user in
                                UserRowView(user: user)
                                Spacer().frame(height: 10)
                            }
                        }
                        .scrollIndicators(.hidden)
                        .toolbar {
                            ToolbarItem(placement: .topBarLeading) {
                                Text("Your Matches")
                                    .foregroundStyle(Color.black)
                                    .font(.custom("K2D-Bold", size: 40))
                            }
                            ToolbarItem(placement: .topBarTrailing) {
                                NavigationLink {

                                } label: {
                                    Text("Questions")
                                        .foregroundStyle(Color.black)
                                        .font(.custom("K2D-Bold", size: 15))
                                }
                            }
                        }
                    }
                    .navigationBarBackButtonHidden()
                }
            case 2:
                InsightPageView()
            case 3:
                ChatView()
            default:
                ProfileView()
            }

            CustomTabBar(selectedTab: $selectedTab)
                .offset(y: 360)
        }
    }
}

#Preview {
    UserListView()
}
