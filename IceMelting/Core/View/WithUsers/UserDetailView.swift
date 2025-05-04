//
//  UserDetailView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 4/5/2025.
//

import SwiftUI

private let assetColorNames = [
    "ShineRed", "LittleBlue", "ArmyGreen", "pinkk", "mint", "blue", "VioPurple", "YesOrNo"
]

struct UserDetailView: View {

    let user: Users
    private var assetColors: [Color] {
        assetColorNames.map { Color($0) }
    }

    var body: some View {
            ZStack {
                Color.skinn.ignoresSafeArea()
                ScrollView {
                VStack(alignment: .leading, spacing: 16) {
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
                        .padding(.horizontal, 6)
                    }

                    MatchKanBan(user: user)

                    IceBreakingSummaryView()

                    Spacer()
                }
                .padding()
            }
        }
        .navigationTitle("Profile")
    }

}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Provide a sample User instance for preview
        let sampleUser = Users(
            name: "Jane Doe",
            MatchRate: 0.75,
            Preference: ["SwiftUI", "iOS", "Badminton"]
        )
        return UserDetailView(user: sampleUser)
    }
}
