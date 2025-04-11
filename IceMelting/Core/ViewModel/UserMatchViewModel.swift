//
//  UserMatchViewModel.swift
//  IceMelting
//
//  Created by Wendy Zhou on 12/4/2025.
//

import Foundation
import Combine

/// The view model responsible for matching user profiles.
final class UserMatchViewModel: ObservableObject {
    // The current user profile (for whom we want to find matches)
    @Published var currentUser: UserProfile? {
        didSet {
            computeMatchResults()
        }
    }
    
    // A list of potential user profiles that could match with the current user.
    @Published var potentialMatches: [UserProfile] = [] {
        didSet {
            computeMatchResults()
        }
    }
    
    // A computed list of match results that include the match percentage for each potential match.
    @Published var matchResults: [MatchResult] = []
    
    /// Struct representing the match result for a given user.
    struct MatchResult: Identifiable {
        let id = UUID()
        let user: UserProfile
        let matchPercentage: Double
    }
    
    /// Computes the match percentage between the current user and each potential match,
    /// then sorts the results in descending order (highest match first).
    private func computeMatchResults() {
        guard let current = currentUser else {
            matchResults = []
            return
        }
        
        let results = potentialMatches.map { profile in
            MatchResult(user: profile, matchPercentage: current.matchPercentage(with: profile))
        }
        
        // Sort the match results so that the best matches appear first
        matchResults = results.sorted { $0.matchPercentage > $1.matchPercentage }
    }
    
    // MARK: - Methods for Modifying Data
    
    /// Adds a new potential match and recomputes match results.
    func addPotentialMatch(_ profile: UserProfile) {
        potentialMatches.append(profile)
    }
    
    /// Updates the current user and automatically triggers re-evaluation of match results.
    func updateCurrentUser(_ profile: UserProfile) {
        currentUser = profile
    }
    
    /// Replace the entire list of potential matches and recomputes match results.
    func updatePotentialMatches(_ profiles: [UserProfile]) {
        potentialMatches = profiles
    }
    
    // Optionally, you may add initializers or methods that fetch data from your backend.
}
