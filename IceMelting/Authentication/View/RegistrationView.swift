//
//  RegistrationView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 14/4/2025.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseStorage

struct RegistrationView: View {
    
    @StateObject private var viewModel = RegistrationViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.skinn.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 5) {
                        
                        // TODO: Register with Google
                        Button {
                            
                        } label: {
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 8).foregroundColor(.white))
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    }
                    
                    // TODO: Register with Facebook
                    
                    Button {
                        
                    } label: {
                        Text("Login with Facebook")
                    }
                    
                    
                    Text("Email")
                    TextField("Enter your email", text: $viewModel.emailText)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .padding(15)
                        .frame(height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background {
                            RoundedRectangle(cornerRadius: 8).opacity(0.8)
                                .foregroundStyle(Color.white)
                        }
                    
                    Text("Password")
                    SecureField("Enter your password", text: $viewModel.passwordText)
                        .padding(15)
                        .frame(height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background {
                            RoundedRectangle(cornerRadius: 8).opacity(0.8)
                                .foregroundStyle(Color.white)
                        }
                    
                    Button {
                        viewModel.userRegister()
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
        .alert("Registration Error", isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.errorMessage)
        }
        .fullScreenCover(isPresented: $viewModel.showImagePicker, onDismiss: nil) {
            ImagePicker(image: $viewModel.image)
        }
    }
}


#Preview {
    RegistrationView()
}
