//
//  SignInEmailView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 15/4/2025.
//

import SwiftUI

struct SignInEmailView: View {
    
    @StateObject private var EmailVM = SignInEmailViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack(spacing: 30) {
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

        }
        .padding()
        .navigationTitle("Sign In With Email")
    }
}

#Preview {
    NavigationStack {
        SignInEmailView(showSignInView: .constant(false))
    }
}

