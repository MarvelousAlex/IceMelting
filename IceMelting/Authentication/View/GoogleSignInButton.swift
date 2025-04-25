//
//  GoogleSignInButton.swift
//  Tablr
//
//  Created by Wendy Zhou on 13/2/2025.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn
import FirebaseCore

struct GoogleSignInButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 0) {
                Image("Google-cloud")
                    .resizable()
                    .frame(width: 60, height: 60)
                Text("Register with Google")
                    .font(.custom("K2D-Bold", size: 18))
                    .foregroundStyle(Color.white)
            }
            .background {
                RoundedRectangle(cornerRadius: 99)
                    .frame(width: 360, height: 60)
                    .foregroundStyle(Color.black)
            }
        }
        .padding(.horizontal, 20)
    }
}

struct GoogleSignInButton_Previews: PreviewProvider {
    static var previews: some View {
        GoogleSignInButton {
            print("Button tapped")
        }
    }
}

