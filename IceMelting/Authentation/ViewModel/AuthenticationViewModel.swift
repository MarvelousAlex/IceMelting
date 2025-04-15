//
//  AuthenticationViewModel.swift
//  IceMelting
//
//  Created by Wendy Zhou on 15/4/2025.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

@MainActor
final class AuthenticationViewModel: ObservableObject {
    func signInGoogle() async throws {
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        try await AuthenticationManager.shared.signInWithGoogle(token: tokens)
    }
}
