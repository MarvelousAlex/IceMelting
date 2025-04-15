//
//  RegistrationViewModel.swift
//  IceMelting
//
//  Created by Wendy Zhou on 15/4/2025.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseStorage
import GoogleSignIn
import FirebaseCore

final class RegistrationViewModel: ObservableObject {
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    @Published var errorMessage: String = ""
    @Published var showAlert: Bool = false
    @Published var showImagePicker: Bool = false
    @Published var image: UIImage?
    
    func userRegister() {
        FirebaseManager.shared.auth.createUser(withEmail: emailText, password: passwordText) { [weak self] result, error in
            DispatchQueue.main.async {
                guard let self = self else { return }
                if let error = error {
                    if let errorCode = AuthErrorCode(rawValue: error._code), errorCode == .emailAlreadyInUse {
                        self.errorMessage = "The email is already registered. Please log in or use a different email."
                    } else {
                        self.errorMessage = error.localizedDescription
                    }
                    self.showAlert = true
                    return
                }
                print("Account Registered successfully")
                self.persistImageToStorage()
            }
        }
    }
    
    func persistImageToStorage() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let ref = FirebaseManager.shared.storage.reference().child(uid)
        guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return }
        ref.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            ref.downloadURL { url, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                print("Successfully saved image.")
            }
        }
    }
}
