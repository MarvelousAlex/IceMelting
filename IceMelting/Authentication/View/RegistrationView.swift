//
//  RegistrationView.swift
//  Tablr
//
//  Created by Wendy Zhou on 25/2/2025.
//


import SwiftUI
import FirebaseAuth

struct RegistrationView: View {
    @StateObject var authVM = AuthViewModel()
    @State private var email: String = ""
    @State private var password: String = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 30) {
            Text("Register for Tablr🤩")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 40)
            
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(8)
                
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(8)
            
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
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 45)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer().frame(height: 200)
        }
        .frame(width: UIScreen.main.bounds.width * 0.9, height: 45)
        .navigationTitle("Register")
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
