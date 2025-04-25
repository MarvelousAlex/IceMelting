//
//  WelcomeView.swift
//  Tablr
//
//  Created by Wendy Zhou on 13/2/2025.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn


struct WelcomeView: View {
    @StateObject var authVM = AuthViewModel()
    // This state controls navigation to MainView upon successful sign-in.
    @State private var showMainView = false
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String?
    @State private var isLoading = false
    
    func signIn() {
        // Clear any previous error message
        errorMessage = nil
        isLoading = true
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            isLoading = false
            if let error = error {
                errorMessage = error.localizedDescription
                print("Firebase sign in error: \(error.localizedDescription)")
                return
            }
            
            // Successful sign in – you can now update your app state accordingly.
            print("User signed in: \(result?.user.uid ?? "unknown")")
            // For example, you might switch the view here.
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.skinn.ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 20) {
                        // App title/welcome message.
                        Text("Welcome")
                            .font(.custom("K2D-Bold", size: 15))
                            .foregroundStyle(Color.black)
                            .frame(maxWidth: .infinity)
                        
                        
                        // Google Login Button using Swift concurrency.
                        Button {
                            Task {
                                do {
                                    try await authVM.signInGoogle()
                                    // If successful, navigate to MainView.
                                    showMainView = true
                                } catch {
                                    print("Google sign in failed: \(error.localizedDescription)")
                                }
                            }
                        } label: {
                            HStack(spacing: 0) {
                                Image("Google-cloud")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                Text("Login with Google")
                                    .font(.custom("K2D-Bold", size: 18))
                                    .foregroundStyle(Color.white)
                            }
                            .background {
                                RoundedRectangle(cornerRadius: 99)
                                    .frame(width: 360, height: 60)
                                    .foregroundStyle(Color.black)
                            }
                        }
                        
//                        GoogleSignInButton {
//                            Task {
//                                do {
//                                    try await authVM.signInGoogle()
//                                    // If successful, navigate to MainView.
//                                    showMainView = true
//                                } catch {
//                                    print("Google sign in failed: \(error.localizedDescription)")
//                                }
//                            }
//                        }
                        
                        DividerWithMsg
                        
                        //                        Spacer().frame(height: 5)
                        
                        VStack(alignment: .leading) {
                            Text("Email")
                                .foregroundStyle(Color.black)
                                .font(.custom("K2D-Regular", size: 15))
                            
                            // Email Login Button (navigates to email sign-in screen).
                            TextField("Enter your email", text: $email)
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.none)
                                .padding(15)
                                .frame(height: 50, alignment: .center)
                                .foregroundColor(.black)
                                .background {
                                    RoundedRectangle(cornerRadius: 16).opacity(0.8)
                                        .foregroundStyle(Color.white)
                                }
                            
                            Spacer().frame(height: 10)
                            
                            Text("Password")
                                .foregroundStyle(Color.black)
                                .font(.custom("K2D-Regular", size: 15))
                            
                            SecureField("Enter your password", text: $password)
                                .padding(15)
                                .frame(height: 50, alignment: .center)
                                .foregroundColor(.black)
                                .background {
                                    RoundedRectangle(cornerRadius: 16).opacity(0.8)
                                        .foregroundStyle(Color.white)
                                }
                        }
                        
                        if let errorMessage = errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                        }
                        
                        Text("Don't have an account? Register here")
                        
                        Button(action: {
                            signIn()
                        }) {
                            if isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(8)
                            } else {
                                Text("Login")
                                    .padding(15)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.white)
                                    .background {
                                        RoundedRectangle(cornerRadius: 16).opacity(0.8)
                                            .foregroundStyle(Color.black)
                                    }
                            }
                        }
                        .disabled(isLoading)
                        .padding(.top, 10)
                        
                        Spacer()
                    }
                    .padding()
                }
            }
            
            // Hidden navigation link that triggers when showMainView is true.
            .navigationDestination(isPresented: $showMainView) {
                AppLoadingPage()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

extension WelcomeView {
    private var DividerWithMsg: some View {
        HStack {
            Rectangle()
                .frame(width: 85, height: 1)
                .offset(x: -10)
            Text("Or log in with email")
                .font(.custom("K2D-Regular", size: 18))
                .foregroundStyle(Color.black)
            Rectangle()
                .frame(width: 85, height: 1)
                .offset(x: 10)
        }
        .frame(width: 360)
    }
}
