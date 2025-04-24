//
//  Contact.swift
//  IceMelting
//
//  Created by Wendy Zhou on 24/4/2025.
//

import Foundation

/// A chat contact to display in the message list
struct Contact: Identifiable {
    let id: UUID = UUID()
    let name: String
    let imageName: String
    let subtitle: String
    let hasNewMessages: Bool
}
