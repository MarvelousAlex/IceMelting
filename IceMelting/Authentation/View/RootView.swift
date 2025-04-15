//
//  RootView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 15/4/2025.
//

import SwiftUI

struct RootView: View {
    
    @State private var showSingInView: Bool = false
    
    var body: some View {
        ZStack {
            if !showSingInView {
                NavigationStack {
                    AppLoadingPage()
                }
            }
        }
        .onAppear(perform: {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSingInView = authUser == nil ? true : false
        })
        .fullScreenCover(isPresented: $showSingInView) {
            NavigationStack {
                AuthenticationView(showSignInView: $showSingInView)
            }
        }
    }
}

#Preview {
    RootView()
}
