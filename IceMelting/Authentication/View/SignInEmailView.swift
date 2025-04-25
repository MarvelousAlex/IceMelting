//
//  SignInEmailView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 25/4/2025.
//

import SwiftUI
import FirebaseAuth

struct SignInEmailView: View {
    
    @StateObject var authVM = AuthViewModel()
    @State private var email: String = ""
    @State private var password: String = ""
    @Environment(\.dismiss) var dismiss
    @State private var showMainView = false
    
    var body: some View {
        VStack(spacing: 30) {
            
            // Google Login Button using Swift concurrency.
            GoogleSignInButton {
                Task {
                    do {
                        try await authVM.signInGoogle()
                        // If successful, navigate to MainView.
                        showMainView = true
                    } catch {
                        print("Google sign in failed: \(error.localizedDescription)")
                    }
                }
            }
            
            Button(action: {
                Task {
                    do {
                        try await authVM.register(withEmail: email, password: password)
                        // On successful registration, dismiss the registration view.
                        dismiss()
                    } catch {
                        print("Registration failed: \(error.localizedDescription)")
                    }
                }
            }) {
                Text("Register")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 45)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    SignInEmailView()
}
