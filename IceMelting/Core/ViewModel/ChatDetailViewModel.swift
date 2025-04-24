//
//  ChatDetailViewModel.swift
//  IceMelting
//
//  Created by Wendy Zhou on 24/4/2025.
//

import SwiftUI

/// ViewModel for ChatDetailView, manages messages and input
class ChatDetailViewModel: ObservableObject {
    /// The contact this chat is with
    let contact: Contact

    /// All messages in this chat
    @Published var messages: [Message] = []
    /// The text currently entered in the input field
    @Published var newMessage: String = ""

    init(contact: Contact) {
        self.contact = contact
        // Sample messages – replace with real data source as needed
        messages = [
            Message(text: "Dear \(contact.name), This is an invitation from Jason! Come to be my teammate!",
                    isCurrentUser: true,
                    time: "12:19 pm"),
            Message(text: "I am glad to be your teammate! See you around!",
                    isCurrentUser: false,
                    time: "12:25 pm"),
            Message(text: "Excellence!",
                    isCurrentUser: true,
                    time: "12:26 pm")
        ]
    }

    /// Appends the current `newMessage` to `messages` and clears the input
    func sendMessage() {
        let trimmed = newMessage.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        // Format current time as short style
        let timeString = DateFormatter.localizedString(
            from: Date(),
            dateStyle: .none,
            timeStyle: .short
        )
        messages.append(
            Message(
                text: trimmed,
                isCurrentUser: true,
                time: timeString
            )
        )
        newMessage = ""
    }
}
