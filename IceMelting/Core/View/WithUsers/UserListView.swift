//
//  UserListView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 22/4/2025.
//

import SwiftUI

struct UserListView: View {
    
    @StateObject private var viewModel = UsersViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.skinn.ignoresSafeArea()
                ScrollView {
                    ForEach(viewModel.usersList) { user in
                        NavigationLink(destination: UserDetailView(user: user)) {
                            UserRowView(user: user)
                                .padding(10)
                        }
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
                        Text("Questions")
                            .foregroundStyle(Color.black)
                            .font(.custom("K2D-Bold", size: 15))
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    UserListView()
}
