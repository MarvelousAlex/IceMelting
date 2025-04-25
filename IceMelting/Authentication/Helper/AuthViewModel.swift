//
//  AuthViewModel.swift
//  Tablr
//
//  Created by Wendy Zhou on 13/2/2025.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn
import FirebaseCore

enum SignInError: Error {
    case noClientID, noRootViewController, noIDToken
}

class AuthViewModel: ObservableObject {
    
    func signInGoogle() async throws {
        // 1. Retrieve clientID from Firebase configuration.
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            throw SignInError.noClientID
        }
        // 2. Set up Google Sign-In configuration.
        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: clientID)
        
        // 3. Get the top view controller (for presenting the sign‑in flow).
        guard let windowScene = await UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = await windowScene.windows.first?.rootViewController else {
            throw SignInError.noRootViewController
        }
        
        // 4. Await the Google sign‑in result.
        let signInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController, hint: nil, additionalScopes: nil)
        
        // 5. Extract the tokens.
        let user = signInResult.user
        guard let idToken = user.idToken?.tokenString else {
            throw SignInError.noIDToken
        }
        let accessToken = user.accessToken.tokenString
        
        // 6. Create a Firebase credential.
        let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                       accessToken: accessToken)
        
        // 7. Sign in with Firebase using the credential.
        _ = try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<AuthDataResult, Error>) in
            Auth.auth().signIn(with: credential) { result, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let result = result {
                    continuation.resume(returning: result)
                }
            }
        }
        print("User signed in with Google.")
    }
    
    func register(withEmail email: String, password: String) async throws {
            let _ = try await Auth.auth().createUser(withEmail: email, password: password)
        }
    
}

