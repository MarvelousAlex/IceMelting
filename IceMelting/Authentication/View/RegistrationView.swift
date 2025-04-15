//
//  RegistrationView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 14/4/2025.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct RegistrationView: View {
    
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.skinn.ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 20) {
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "person.fill")
                                .font(.system(size: 64))
                                .padding()
                        }
                        
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
                            userRegister()
                        } label: {
                            Text("Register")
                                .padding(15)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .background {
                                    RoundedRectangle(cornerRadius: 16).opacity(0.8)
                                        .foregroundStyle(Color.gray.opacity(0.5))
                                }
                        }
                        
                    }
                    .padding()
                }
            }
            .navigationTitle("Welcome to IceMelting")
        }
    }
    
    private func userRegister() {
        Auth.auth().createUser(withEmail: emailText, password: passwordText) { result, error in
            if let error = error {
                print("Failed", error)
                return
            }
            print("Success!!")
        }
        
    }
}

#Preview {
    RegistrationView()
}
