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
            VStack {
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
                        Text("Sign in with Google")
                            .font(.custom("K2D-Bold", size: 18))
                    }
                    .foregroundStyle(Color.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
//            TODO: Sign in with facebook
                
                Spacer()
                
                HStack {
                    Rectangle()
                        .frame(width: 100, height: 1)
                        .offset(x: -15)
                    Text("Or log in with email")
                    Rectangle()
                        .frame(width: 100, height: 1)
                        .offset(x: 15)
                }
                .frame(maxWidth: .infinity)
                
                TextField("Email...", text: $EmailVM.email)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                SecureField("Password...", text: $EmailVM.password)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button {
                    Task {
                        do {
                            try await EmailVM.signUp()
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
                    Text("Sign In With Email")
                        .font(.headline)
                        .foregroundStyle(Color.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                
                Spacer()
            }
//            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    NavigationStack {
        AuthenticationView(showSignInView: .constant(false))
    }
}
