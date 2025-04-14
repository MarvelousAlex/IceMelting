//
//  LoginView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 14/4/2025.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.skinn.ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 20) {
                                               
                        TextField("Email", text: $emailText)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.none)
                            .padding(15)
                            .frame(height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .background {
                                RoundedRectangle(cornerRadius: 16).opacity(0.8)
                                    .foregroundStyle(Color.gray.opacity(0.5))
                            }
                        SecureField("Password", text: $passwordText)
                            .padding(15)
                            .frame(height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .background {
                                RoundedRectangle(cornerRadius: 16).opacity(0.8)
                                    .foregroundStyle(Color.gray.opacity(0.5))
                            }
                        
                        Button {
                            loginUser()
                        } label: {
                            Text("Login")
                                .padding(15)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .background {
                                    RoundedRectangle(cornerRadius: 16).opacity(0.8)
                                        .foregroundStyle(Color.gray.opacity(0.5))
//                                        .frame(width: 200)
                                }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Welcome Back")
            .alert("Login Error", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    private func loginUser() {
        FirebaseManager.shared.auth.signIn(withEmail: emailText, password: passwordText) { authResult, error in
                if let error = error {
                    // Check if the error corresponds to a not-registered email.
                    if let errorCode = AuthErrorCode(rawValue: error._code), errorCode == .userNotFound {
                        alertMessage = "The email is not registered. Please register first."
                    } else {
                        alertMessage = error.localizedDescription
                    }
                    showAlert = true
                    return
                }
                // Successful login handling.
                if let userEmail = authResult?.user.email {
                    print("User logged in: \(userEmail)")
                }
            }
        }
}

#Preview {
    LoginView()
}
