//
//  UserProfile.swift
//  IceMelting
//
//  Created by Wendy Zhou on 12/4/2025.
//

import Foundation

// Represents the expectation of marks
enum MarkExpectation: String, Codable, CaseIterable {
    case highDistinction = "High Distinction"
    case distinction = "Distinction"
    case credit = "Credit"
    case pass = "Pass"
}

// Represents a user's profile including fields used for matching.
struct UserProfile: Identifiable, Codable {
    // A unique identifier for each user.
    let id: UUID = UUID()
    
    // User’s name (optional, can be used in the UI)
    var name: String
    
    // The user's major (e.g., Computer Science, Business, etc.)
    var major: String
    
    // Answers to one or more opening questions.
    var openingQuestions: [String]
    
    // A list of hobbies.
    var hobbies: [String]
    
    // The user's expectation of marks.
    var expectedMark: MarkExpectation
}

// MARK: - Matching Extension
extension UserProfile {
    
    /// Computes the matching percentage with another user profile.
    /// The matching is based on:
    ///   - Major (30% if majors are identical)
    ///   - Opening Questions (30% weight, proportional to overlap)
    ///   - Hobbies (20% weight, proportional to overlap)
    ///   - Expected Mark (20% if matches exactly)
    func matchPercentage(with other: UserProfile) -> Double {
        var totalScore = 0.0
        let maxScore = 100.0
        
        // 1. Major Matching (Weight: 30%)
        if self.major.lowercased() == other.major.lowercased() {
            totalScore += 30.0
        }
        
        // 2. Opening Questions Matching (Weight: 30%)
        let selfQuestions = Set(self.openingQuestions.map { $0.lowercased() })
        let otherQuestions = Set(other.openingQuestions.map { $0.lowercased() })
        let commonQuestions = selfQuestions.intersection(otherQuestions)
        let maxQuestions = max(selfQuestions.count, otherQuestions.count)
        if maxQuestions > 0 {
            let questionMatchScore = (Double(commonQuestions.count) / Double(maxQuestions)) * 30.0
            totalScore += questionMatchScore
        }
        
        // 3. Hobbies Matching (Weight: 20%)
        let selfHobbies = Set(self.hobbies.map { $0.lowercased() })
        let otherHobbies = Set(other.hobbies.map { $0.lowercased() })
        let commonHobbies = selfHobbies.intersection(otherHobbies)
        let maxHobbies = max(selfHobbies.count, otherHobbies.count)
        if maxHobbies > 0 {
            let hobbyMatchScore = (Double(commonHobbies.count) / Double(maxHobbies)) * 20.0
            totalScore += hobbyMatchScore
        }
        
        // 4. Expected Mark Matching (Weight: 20%)
        if self.expectedMark == other.expectedMark {
            totalScore += 20.0
        }
        
        // Ensure the score does not exceed 100%
        return min(totalScore, maxScore)
    }
}
