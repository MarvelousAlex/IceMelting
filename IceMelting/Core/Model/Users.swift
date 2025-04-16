//
//  UserProfile.swift
//  IceMelting
//
//  Created by Wendy Zhou on 12/4/2025.
//

import Foundation

struct Users: Identifiable, Codable {
    var id = UUID()
    let name: String
    var MatchRate: Double  // Match Rate, e.g. 75.00%
    var Preference: [String] // collect the user answers
}

let users: [Users] = [
    Users(name: "Wendy", MatchRate: 0.75, Preference: ["HD", "Data Analytics", "iOS", "SwiftUI", "Badminton"]),
    Users(name: "Nixon", MatchRate: 0.21, Preference: ["D", "Cloud Computing", "Android", "Basketball"]),
    Users(name: "Obama", MatchRate: 0.37, Preference: ["HD", "Engineering", "Remote Control", "Reading"]),
    Users(name: "Antony", MatchRate: 0.66, Preference: ["Credit", "Interaction", "SpaceX", "Swimming"]),
    Users(name: "Joe", MatchRate: 0.89, Preference: ["Pass", "Design", "UI/UX", "Badminton"]),
    Users(name: "Trump", MatchRate: 1.00, Preference: ["HD", "Design", "UI/UX", "Badminton"]),
    Users(name: "Biden", MatchRate: 0.5, Preference: ["Pass", "Design", "UI/UX", "Badminton"]),
    Users(name: "Jefferson", MatchRate: 0.23, Preference: ["Credit", "Design", "UI/UX", "Badminton"]),
    Users(name: "Tomas", MatchRate: 0.54, Preference: ["D", "Design", "UI/UX", "Badminton"]),
    Users(name: "Washington", MatchRate: 0.45, Preference: ["Credit", "Design", "UI/UX", "Badminton"]),
]
