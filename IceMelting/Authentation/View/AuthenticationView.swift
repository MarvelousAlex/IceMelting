//
//  AuthenticationView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 15/4/2025.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct AuthenticationView: View {
    
    @StateObject private var AuthVM = AuthenticationViewModel()
    @StateObject private var EmailVM = SignInEmailViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        ZStack {
            Color.skinn.ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Welcome")
                    .font(.custom("K2D-Regular", size: 20))
                    .frame(maxWidth: .infinity)
                
                Button {
                    Task {
                        do {
                            try await AuthVM.signInGoogle()
                            showSignInView = false
                        } catch {
                            print("Google sign-in error: \(error)")
                        }
                    }
                } label: {
                    HStack(spacing: 0) {
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
                
                //            TODO: Sign in with facebook
                
                //                Spacer()
                
                HStack {
                    Rectangle()
                        .frame(width: 85, height: 1)
                        .offset(x: -10)
                    Text("Or register with email")
                    Rectangle()
                        .frame(width: 85, height: 1)
                        .offset(x: 10)
                }
                .frame(width: 360)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Email")
                        .font(.custom("K2D-SemiBold", size: 16))
                        .frame(alignment: .leading)
                    TextField("Enter your email...", text: $EmailVM.email)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    Spacer().frame(height: 10)
                    Text("Password")
                        .font(.custom("K2D-SemiBold", size: 16))
                    SecureField("Enter your password...", text: $EmailVM.password)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    Text("Forget Password🤔")
                        .font(.custom("K2D-SemiBold", size: 14))
                        .underline()
                }
                .frame(width: 360)
                
                Spacer()
                Text("Don't have a account?")
                    .font(.custom("K2D-SemiBold", size: 14))
                    .underline()
                Button {
                    Task {
                        do {
                            try await EmailVM.signUp() // also sign in is there 😍
                            showSignInView = false
                            return
                        } catch {
                            print(error)
                        }
                        
                        do {
                            try await EmailVM.signIn()
                            showSignInView = false
                            return
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    Text("Login")
                        .font(.headline)
                        .foregroundStyle(Color.white)
                        .background {
                            RoundedRectangle(cornerRadius: 99)
                                .frame(width: 360, height: 60)
                                .foregroundStyle(Color.black)
                        }
                }
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    NavigationStack {
        AuthenticationView(showSignInView: .constant(false))
    }
}
