//
//  ChatBotView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 14/5/2025.
//

import SwiftUI
import UIKit

struct ChatBubble: View {
    let text: String
    let isUser: Bool

    var body: some View {
        HStack(alignment: .top) {
            if !isUser {
                Image(systemName: "brain.head.profile")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(6)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            Text(text)
                .padding()
                .background(isUser ? Color.white : Color.blue.opacity(0.2))
                .cornerRadius(20)
            if isUser {
                Spacer()
            }
        }
    }
}

struct ChatBotView: View {

    @State private var textFieldText: String = ""
    @Binding var showChatbot: Bool
    @StateObject private var geminiVM = GenimiViewModel()
    @State private var keyboardHeight: CGFloat = 0

    var body: some View {
        VStack(spacing: 0) {

            HStack {
                Button(action: {
                    withAnimation {
                        showChatbot = false
                    }
                }) {
                    Image(systemName: "arrow.backward")
                        .padding()
                }

                Spacer()

                Text("Chat with Bot")
                    .font(.headline)
                    .bold()

                Spacer()

                Button(action: {
                    // Maybe refresh conversation
                }) {
                    Image(systemName: "arrow.clockwise")
                        .padding()
                }
            }
            .padding(.horizontal)

            Divider()

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {

                    ForEach(geminiVM.MsgList, id: \.self) { msg in
                        ChatBubble(text: msg.content, isUser: msg.sender == "user")
                    }
                }
                .padding(.horizontal)
            }

            Divider()

            HStack {
                TextField("Ask me anything...", text: $textFieldText)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(20)


                Button {
                    geminiVM.MsgList
                        .append(
                            MessageModel(content: textFieldText, sender: "user")
                        )
                    Task {
                        await geminiVM.getResponse(message: textFieldText)
                    }
                    textFieldText = ""
                } label: {
                    Image(systemName: "paperplane.fill")
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 2)
        }
        .padding(.bottom, keyboardHeight)
        .padding()
        .background(Color.yellow)
        .cornerRadius(20)
        .shadow(radius: 10)
        .transition(.move(edge: .bottom))
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notif in
                if let frame = notif.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                    keyboardHeight = frame.height
                }
            }
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                keyboardHeight = 0
            }
        }
    }
}

#if DEBUG
struct ChatBotView_Previews: PreviewProvider {
    @State static var showChatbot = true

    static var previews: some View {
        ChatBotView(showChatbot: $showChatbot)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
#endif
