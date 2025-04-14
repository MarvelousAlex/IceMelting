//
//  FirebaseManager.swift
//  IceMelting
//
//  Created by Wendy Zhou on 14/4/2025.
//

import Foundation
import Firebase
import FirebaseAuth

class FirebaseManager: NSObject {
    let auth: Auth
    static let shared = FirebaseManager()
    
    override init() {
        FirebaseApp.configure()
        self.auth = Auth.auth()
        super.init()
    }
}
