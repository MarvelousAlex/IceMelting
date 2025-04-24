//
//  Message.swift
//  IceMelting
//
//  Created by Wendy Zhou on 24/4/2025.
//

import Foundation

/// Represents a single chat message
struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isCurrentUser: Bool
    let time: String
}
