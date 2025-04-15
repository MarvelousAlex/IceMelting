//
//  SettingsView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 15/4/2025.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject private var vm = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        List {
            Button("Log out") {
                Task {
                    do {
                        try vm.signOut()
                        showSignInView = true
                    } catch {
                        print(error)
                    }
                }
            }
            if vm.authProviders.contains(.email) {
                emailSection
            }
        }
        .onAppear(perform: {
            vm.loadAuthProviders()
        })
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack {
        SettingsView(showSignInView: .constant(false))
    }
}

extension SettingsView {
    private var emailSection: some View {
        Section("Email functions") {
            Button("Reset passowrd") {
                Task {
                    do {
                        try await vm.resetPassword()
                        print("changed!!")
                    } catch {
                        print(error)
                    }
                }
            }
            
            Button("Update passowrd") {
                Task {
                    do {
                        try await vm.updatePassword()
                    } catch {
                        print(error)
                    }
                }
            }
            
            Button("Update email") {
                Task {
                    do {
                        try await vm.updateEmail()
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
}
