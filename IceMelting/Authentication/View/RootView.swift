//
//  RootView.swift
//  Tablr
//
//  Created by Wendy Zhou on 12/2/2025.
//


import SwiftUI

struct RootView: View {
    @StateObject var sessionStore = SessionStore()
    
    var body: some View {
        Group {
            if sessionStore.user != nil {
                AppLoadingPage()
                    .environmentObject(sessionStore)
            } else {
                AuthenticationView()
                    .environmentObject(sessionStore)
            }
        }
        .onAppear {
            sessionStore.listen()
        }
    }
}
