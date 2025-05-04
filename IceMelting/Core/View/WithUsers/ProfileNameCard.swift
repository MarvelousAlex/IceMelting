//
//  ProfileNameCard.swift
//  IceMelting
//
//  Created by Wendy Zhou on 4/5/2025.
//

import SwiftUI

struct ProfileNameCard: View {
    let user: Users
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.armyGreen)
                .frame(width: 360, height: 100)
            Text(user.name)
                .font(.custom("K2D-Bold", size: 30))
                .foregroundStyle(Color.white)
                .bold()
                .padding(.leading, 16)
        }
    }
}

struct ProfileNameCard_Previews: PreviewProvider {
    static var previews: some View {
        let sampleUser = Users(
            name: "Jane Doe",
            MatchRate: 0.85,
            Preference: ["SwiftUI", "Design"]
        )
        ProfileNameCard(user: sampleUser)
    }
}
