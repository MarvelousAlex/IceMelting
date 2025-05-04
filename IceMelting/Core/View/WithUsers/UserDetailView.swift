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
                VStack(spacing: 10) {
                    ProfileNameCard(user: user)

                    TagList

                    Spacer().frame(height: 15)

                    MatchKanBan(user: user)
                        .padding(.horizontal, 6)

                    Spacer().frame(height: 15)

                    IceBreakingSummaryView()
                        .padding(.horizontal, 6)

                    Spacer().frame(height: 15)

                    SkillExchangeView()
                        .padding(.horizontal, 6)

                    Spacer()
                }
                .padding(.horizontal, 8)
            }
        }
        .navigationTitle("Profile")
    }

}

extension UserDetailView {
    private var TagList: some View {
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
        .padding(.horizontal, 14)
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
