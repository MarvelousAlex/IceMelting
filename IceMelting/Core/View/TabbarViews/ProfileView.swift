//
//  ProfileView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 28/3/2025.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @State private var selectedSport: String = "Badminton"
    @Environment(\.dismiss) private var dismiss
    private let sports = ["Badminton", "Basketball", "Tennis", "Swimming", "Baseball", "Volleyball"]
    
    var body: some View {
        ZStack {
            Color.skinn.ignoresSafeArea()
            //            Image("") ???
            VStack(alignment: .leading) {
                Text("Hi, Wendy")
                    .font(.custom("Nunito-SemiBold", size: 30))
                Text("Make your own profile here")
                    .font(.custom("Nunito-SemiBold", size: 18))
                HStack {
                    Text("My hobby is:")
                        .foregroundStyle(Color.black)
                    Picker("Select your favorite sport", selection: $selectedSport) {
                        ForEach(sports, id: \.self) { sport in
                            Text(sport)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding()
                }
               
                
                Spacer()
                
                Button(action: {
                    do {
                        try Auth.auth().signOut()
                    } catch let error as NSError {
                        print("Error signing out: \(error.localizedDescription)")
                    }
                }) {
                    Text("Log Out")
                        .font(.custom("K2D-SemiBold", size: 20))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.littleBlue)
                        .foregroundColor(.white)
                        .cornerRadius(16)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ProfileView()
}
