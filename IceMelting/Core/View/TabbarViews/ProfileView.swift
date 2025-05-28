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
    @EnvironmentObject var sessionStore: SessionStore
    private let sports = ["Badminton", "Basketball", "Tennis", "Swimming", "Baseball", "Volleyball"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.skinn.ignoresSafeArea()
                VStack(spacing: 20) {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(Color.armyGreen)
                        .frame(height: 100)
                        .overlay {
                            HStack {
                                Text("Wendy")
                                    .foregroundStyle(.white)
                                    .font(.custom("K2D-SemiBold", size: 30))
                                    .frame(alignment: .leading)
                                Spacer().frame(width: 250)
                            }
                        }
                    
                    ScrollView(.horizontal) {
                        HStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 50, height: 30)
                                .foregroundStyle(Color.shineRed)
                                .overlay {
                                    Text("HD")
                                }
                            
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 125, height: 30)
                                .foregroundStyle(Color.littleBlue)
                                .overlay {
                                    Text("Data Analtics")
                                }
                            
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 60, height: 30)
                                .foregroundStyle(Color.armyGreen)
                                .overlay {
                                    Text("UI/UX")
                                }
                            
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 110, height: 30)
                                .foregroundStyle(Color.skinYellow)
                                .overlay {
                                    Text("Badminton")
                                }
                        }
                    }
                    
                    IceBreakingSummaryView()
                        .padding(.horizontal, 2)
                    
                    SkillExchangeView()
                        .padding(.horizontal, 2)
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            sessionStore.signOut()
                        } label: {
                            Text("Log Out")
                                .foregroundStyle(.black)
                                .font(.custom("K2D-Bold", size: 16))
                        }

                    }
                }
                .padding(.horizontal, 20)
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    ProfileView()
}
