//
//  ProfileView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 28/3/2025.
//

/*
 // MARK: - Sign out
 Button {
    sessionStore.signOut()
 } label: {
     Text("Log Out")
         .font(.custom("K2D-SemiBold", size: 20))
         .frame(maxWidth: .infinity)
         .padding()
         .background(Color.littleBlue)
         .foregroundColor(.white)
         .cornerRadius(16)
 }
 */

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    @State private var selectedSport: String = "Badminton"
//    @StateObject private var vm = SettingsViewModel()
    @EnvironmentObject var sessionStore: SessionStore
    private let sports = ["Badminton", "Basketball", "Tennis", "Swimming", "Baseball", "Volleyball"]
    
    var body: some View {
        ZStack {
            Color.skinn.ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(Color.armyGreen)
                    .frame(width: 300, height: 100)
                    .overlay {
                        Text("Wendy")
                            .foregroundStyle(.white)
                            .font(.custom("K2D-SemiBold", size: 30))
                            .frame(alignment: .leading)
                    }
            }
            .padding()
        }
    }
}

#Preview {
    ProfileView()
}
