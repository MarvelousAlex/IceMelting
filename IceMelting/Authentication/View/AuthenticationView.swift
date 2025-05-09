//
//  WelcomeView.swift
//  Tablr
//
//  Created by Wendy Zhou on 13/2/2025.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn

struct AuthenticationView: View { 
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
                    VStack(spacing: 20) {
                        // App title/welcome message.
                        Text("Welcome")
                            .font(.custom("K2D-Bold", size: 15))
                            .foregroundStyle(Color.black)
                            .frame(maxWidth: .infinity)
                        
                        // MARK: Google Login Button using Swift concurrency.
                        GoogleLoginButton
                        
                        DividerWithMsg
                        
                        // MARK: Login text Fields
                        LoginTextFields
                        
                        if let errorMessage = errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                        }
                        
                        Spacer().frame(height: 270)
                        
                        // MARK: Navigation to RegistrationView
                        supportingNav
                        
                        // MARK: Login Button
                        LoginButton
                    }
                    .padding()
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        AppLoadingPage()
                    } label: {
                        Text("skip login")
                            .font(.custom("K2D-Semibold", size: 15))
                            .foregroundStyle(Color.black)
                    }

                }
            })
            .navigationBarBackButtonHidden()
            .navigationDestination(isPresented: $showMainView) {
                AppLoadingPage()
            }
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}

extension AuthenticationView {
    
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
    
    private var GoogleLoginButton: some View {
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
            HStack(spacing: 15) {
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
    }
    
    private var LoginTextFields: some View {
        VStack(alignment: .leading) {
            Text("Email")
                .foregroundStyle(Color.black)
                .font(.custom("K2D-Regular", size: 15))
            
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
            
            Spacer().frame(height: 10)
            
            Text("Forget password?")
                .foregroundStyle(Color.black)
                .font(.custom("K2D-Bold", size: 10))
        }
    }
    
    private var supportingNav: some View {
        HStack {
            Text("Don't have an account?")
                .font(.custom("K2D-Bold", size: 15))
                .foregroundStyle(Color.black)
            NavigationLink {
                RegistrationView()
            } label: {
                Text("Register here")
                    .underline()
                    .font(.custom("K2D-Bold", size: 15))
                    .foregroundStyle(Color.black)
            }
        }
        
    }
    
    private var LoginButton: some View {
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
                    .font(.custom("K2D-Bold", size: 20))
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background {
                        RoundedRectangle(cornerRadius: 16).opacity(0.8)
                            .foregroundStyle(Color.black)
                    }
            }
        }
        .disabled(isLoading)
    }
    
}
