//
//  UserRowView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 22/4/2025.
//

import SwiftUI

struct UserRowView: View {
    let user: Users

    var body: some View {
            VStack(spacing: 10) {
                HStack {
                    Text(user.name)
                        .font(.custom("K2D-SemiBold", size: 35))
                    Spacer()
                    Text(" \(Int(user.MatchRate * 100))% Match")
                        .font(.custom("K2D-SemiBold", size: 35))
                        .foregroundStyle(Color.shineRed)
                }
                .padding(.horizontal, 20)
                
                HStack(spacing: 6) {
                    ForEach(user.Preference, id: \.self) { pref in
                        Text(pref)
                            .frame(alignment: .leading)
                            .padding(4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(lineWidth: 1)
                            )
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                
                HStack {
                    NavigationLink {
                        
                    } label: {
                        Text("View Profile")
                            .foregroundStyle(Color.black)
                        
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        Text("Invite")
                            .foregroundStyle(Color.black)
                        
                    }
                }
                .padding(.horizontal, 20)
                .frame(height: 50)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(Color.skinYellow)
                }
            }
            .background(Color.skinn)
            .cornerRadius(16)
            .padding(.horizontal, 10)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: Users(
            name: "Wendy",
            MatchRate: 0.42,
            Preference: ["SwiftUI", "iOS"]
        ))
        .previewLayout(.sizeThatFits)
    }
}

