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
        NavigationView {
            List {
                ForEach(viewModel.usersList, id: \.name) { user in
                    UserRowView(user: user)
                }
            }
            .navigationTitle("Users")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
