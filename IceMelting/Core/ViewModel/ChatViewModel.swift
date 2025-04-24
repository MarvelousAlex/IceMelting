//
//  ChatViewModel.swift
//  IceMelting
//
//  Created by Wendy Zhou on 24/4/2025.
//

import SwiftUI

/// Holds the search state and contact list for ChatView
class ChatViewModel: ObservableObject {
    /// Search text entered in the chat list
    @Published var searchText: String = ""
    
    /// All contacts to display in the chat list
    @Published var contacts: [Contact] = [
        Contact(name: "Jeff", imageName: "JeffAvatar", subtitle: "new messages", hasNewMessages: true),
        Contact(name: "Tom", imageName: "TomAvatar", subtitle: "Active xx ago", hasNewMessages: false),
        Contact(name: "Kate", imageName: "KateAvatar", subtitle: "Active xx ago", hasNewMessages: false),
        Contact(name: "Joe", imageName: "JoeAvatar", subtitle: "Active xx ago", hasNewMessages: false),
        Contact(name: "Cindy", imageName: "CindyAvatar", subtitle: "Active xx ago", hasNewMessages: false),
        Contact(name: "Ian", imageName: "IanAvatar", subtitle: "Active xx ago", hasNewMessages: false),
        Contact(name: "Tina", imageName: "TinaAvatar", subtitle: "Active xx ago", hasNewMessages: false)
    ]
}
