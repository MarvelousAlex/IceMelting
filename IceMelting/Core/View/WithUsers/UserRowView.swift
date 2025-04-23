//
//  UserRowView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 22/4/2025.
//

import SwiftUI
import UIKit

private let assetColorNames = [
    "ShineRed", "LittleBlue", "ArmyGreen", "pinkk", "mint", "blue", "VioPurple", "YesOrNo"
]

struct UserRowView: View {
    
    @State private var isInvited: Bool = false
    let user: Users
    private var assetColors: [Color] {
        assetColorNames.map { Color($0) }
    }
    
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                Text(user.name)
                    .font(.custom("K2D-SemiBold", size: 30))
                    .foregroundStyle(Color.black)
                Spacer()
                Text(" \(Int(user.MatchRate * 100))% Match")
                    .font(.custom("K2D-SemiBold", size: 30))
                    .foregroundStyle(Color.shineRed)
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(Array(user.Preference.enumerated()), id: \.element) { index, pref in
                        Text(pref)
                            .font(.custom("Nunito-Semibold", size: 20))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(assetColors[index % assetColors.count])
                                    .opacity(0.7)
                            )
                    }
                }
                .frame(height: 60)
            }
            
            HStack(spacing: 0) {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(isInvited ? Color.shineRed : Color.skinYellow)
                    .overlay {
                        Button {
                            isInvited.toggle()
                        } label: {
                            Text(isInvited ? "Invited!" : "Invite")
                                .font(.custom("K2D-SemiBold", size: 20))
                                .foregroundStyle(Color.black)
                        }
                        
                    }
                    .animation(.spring(duration: 0.8), value: isInvited)
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(Color.skinYellow)
                    .overlay {
                        NavigationLink {
                            
                        } label: {
                            Text("View Profile")
                                .font(.custom("K2D-SemiBold", size: 20))
                                .foregroundStyle(Color.black)
                        }
                        
                    }
                
            }
            .frame(height: 50)
        }
        .background(Color.matchCard)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal, 10)
    }        
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: Users(
            name: "Wendy",
            MatchRate: 0.42,
            Preference: ["SwiftUI", "iOS", "Design", "Data Analytics", "SwiftUI", "iOS"]
        ))
    }
}

