//
//  RegistrationView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 25/2/2025.
//


import SwiftUI
import FirebaseAuth

struct RegistrationView: View {
    @StateObject var authVM = AuthViewModel()
    @State private var namee: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showMainView = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.skinn.ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 20) {
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
                            HStack(spacing: 15) {
                                Image("Google-cloud")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                Text("Register with Google")
                                    .font(.custom("K2D-Bold", size: 18))
                                    .foregroundStyle(Color.white)
                            }
                            .background {
                                RoundedRectangle(cornerRadius: 99)
                                    .frame(width: 360, height: 60)
                                    .foregroundStyle(Color.black)
                            }
                        }
                        
                        DividerWithMsg
                        
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
                        
                        NavigationLink {
                            RegistrationView()
                        } label: {
                            HStack {
                                Text("Already have an account?")
                                Text("Let's login in")
                                    .underline()
                            }
                            .font(.custom("K2D-Bold", size: 15))
                            .foregroundStyle(Color.black)
                        }
                        
                        // MARK: Important Button
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
                                .padding(15)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .background {
                                    RoundedRectangle(cornerRadius: 16).opacity(0.8)
                                        .foregroundStyle(Color.black)
                                }
                        }
                        
                        Spacer()
                    }
                    .padding()
                }
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

extension RegistrationView {
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
