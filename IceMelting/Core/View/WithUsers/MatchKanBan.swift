//
//  MatchKanBan.swift
//  IceMelting
//
//  Created by Wendy Zhou on 4/5/2025.
//

import SwiftUI

struct MatchKanBan: View {

    let user: Users

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Matching Preview")
                .font(.custom("K2D-Bold", size: 20))
                .padding(.horizontal, 10)

            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Matching Rate with you")
                        .font(.custom("K2D-Regular", size: 18))
                        .foregroundColor(.secondary)
                    Spacer().frame(height: 3)
                    Text("\(Int(user.MatchRate * 100))%")
                        .font(.custom("K2D-Bold", size: 50))
                        .offset(x: 30)
                }

                Spacer().frame(width: 30)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Shared Interests")
                        .font(.custom("K2D-Regular", size: 18))
                        .foregroundColor(.secondary)
                    ForEach(user.Preference, id: \.self) { pref in
                        Text(pref)
                            .font(.custom("K2D-SemiBold", size: 18))
                    }
                }
            }
            .padding(.horizontal, 10)
        }
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .frame(height: 200)
        }
    }
}

struct MatchKanBan_Previews: PreviewProvider {
    static var previews: some View {
        // Provide a sample User instance for preview
        let sampleUser = Users(
            name: "Jane Doe",
            MatchRate: 0.75,
            Preference: ["SwiftUI", "iOS", "Badminton"]
        )
        return MatchKanBan(user: sampleUser)
    }
}
