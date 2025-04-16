//
//  RegisterView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 16/4/2025.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct RegisterView: View {
    
    @StateObject private var AuthVM = AuthenticationViewModel()
    @StateObject private var EmailVM = SignInEmailViewModel()
    @Binding var showSignInView: Bool
    @State private var isChecked: Bool = false
    
    var body: some View {
        ZStack {
            Color.skinn.ignoresSafeArea()
            VStack(spacing: 30) {
                Text("Welcome")
                    .font(.custom("K2D-Bold", size: 25))
                    .foregroundStyle(Color.black)
                    .frame(maxWidth: .infinity)
                
                GoogleSignInButton
                
                Spacer()
                
                // Divider with "Or register with email"
                DividerWithMsg
                
                EmailSignIn
                
                Spacer()
                
                SignUpButton
                    .animation(.spring(), value: isChecked)
                
            }
        }
    }
}

#Preview {
    NavigationStack {
        RegisterView(showSignInView: .constant(false))
    }
}

extension RegisterView {
    private var GoogleSignInButton: some View {
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
    }
    
    private var DividerWithMsg: some View {
        HStack {
            Rectangle()
                .frame(width: 85, height: 1)
                .offset(x: -10)
            Text("Or register with email")
                .foregroundStyle(Color.black)
            Rectangle()
                .frame(width: 85, height: 1)
                .offset(x: 10)
        }
        .frame(width: 360)
    }
    
    private var EmailSignIn: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Name")
                .font(.custom("K2D-SemiBold", size: 16))
                .foregroundStyle(Color.black)
                .frame(alignment: .leading)
            TextField("Enter your name", text: $EmailVM.name)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Text("Email")
                .font(.custom("K2D-SemiBold", size: 16))
                .foregroundStyle(Color.black)
                .frame(alignment: .leading)
            TextField("Enter your email", text: $EmailVM.email)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            Text("Password")
                .font(.custom("K2D-SemiBold", size: 16))
            SecureField("Enter your password", text: $EmailVM.password)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Toggle("I accept and agree to comply with terms and condition and Privacy Policy", isOn: $isChecked)
                .toggleStyle(.checkbox)
                .font(.custom("K2D-SemiBold", size: 14))
                .underline()
        }
        .frame(width: 360)
    }
    
    private var SignUpButton: some View {
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
                    try await EmailVM.signUp()
                    showSignInView = false
                    return
                } catch {
                    print(error)
                }
            }
        } label: {
            Text("Register")
                .font(.headline)
                .foregroundStyle(Color.white)
                .background {
                    RoundedRectangle(cornerRadius: 99)
                        .frame(width: 360, height: 60)
                        .foregroundStyle(isChecked ? Color.black : Color.gray.opacity(0.7))
                }
        }
    }
}
