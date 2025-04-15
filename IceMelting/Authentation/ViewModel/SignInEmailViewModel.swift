//
//  SignInEmailViewModel.swift
//  IceMelting
//
//  Created by Wendy Zhou on 15/4/2025.
//

import SwiftUI

final class SignInEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No info found")
            return
        }
        
        let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No info found")
            return
        }
        
        let returnedUserData = try await AuthenticationManager.shared.signInUser(email: email, password: password)
    }
}
