//
//  SkillExchangeView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 4/5/2025.
//


import SwiftUI

struct SkillExchangeView: View {
    // Sample data; replace with your own
    let shareSkills = [
        "UI/UX Design",
        "Figma Prototyping",
        "User Research",
        "Design Thinking"
    ]
    let learnSkills = [
        "Frontend Development",
        "Motion Design",
        "Product Management",
        "Design Systems"
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Skill Exchange")
                .font(.custom("Nunito-Bold", size: 20))
                .bold()

            HStack(alignment: .top, spacing: 16) {
                skillsCard(
                    title: "Skills I Can Share",
                    skills: shareSkills,
                    backgroundColor: Color.blue.opacity(0.2)
                )

                skillsCard(
                    title: "Skills I Want to Learn",
                    skills: learnSkills,
                    backgroundColor: Color.pink.opacity(0.2)
                )
            }
//            .padding()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
    }

    @ViewBuilder
    private func skillsCard(title: String,
                            skills: [String],
                            backgroundColor: Color) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.custom("Nunito-Semibold", size: 20))

            ForEach(skills, id: \.self) { skill in
                HStack(alignment: .top, spacing: 4) {
                    Text("•")
                    Text(skill)
                }
                .font(.custom("Nunito-Semibold", size: 16))
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(backgroundColor)
        .cornerRadius(12)
    }
}

struct SkillExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        SkillExchangeView()
            .preferredColorScheme(.light)
    }
}
