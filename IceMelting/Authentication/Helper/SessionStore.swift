//
//  SessionStore.swift
//  IceMelting
//
//  Created by Wendy Zhou on 25/4/2025.
//

import SwiftUI
import FirebaseAuth

class SessionStore: ObservableObject {
    @Published var user: User?
    private var handle: AuthStateDidChangeListenerHandle?

    // Start listening for auth changes.
    func listen() {
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            print("Auth state changed. User is now: \(String(describing: user))")
            self.user = user
        }
    }

    // Call this method to sign out.
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
    
    deinit {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
}
