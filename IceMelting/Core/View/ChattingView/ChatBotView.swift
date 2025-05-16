//
//  ChatBotView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 14/5/2025.
//

import SwiftUI

struct ChatBotView: View {

    @State private var textFiledText: String = ""
    @Binding var showChatbot: Bool
    @StateObject private var geminiVM = GenimiViewModel()

    var body: some View {
        VStack {
            Spacer()

            VStack(spacing: 16) {
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

                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {

                        ForEach(geminiVM.MsgList, id:\.self) { msg in
                            if msg.sender == "user" {
                                HStack(alignment: .top) {
                                    Text(msg.content)
                                        .padding()
                                        .background(Color.white)
                                        .cornerRadius(20)
                                }
                            } else {
                                HStack(alignment: .top) {
                                    Image(systemName: "brain.head.profile")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .padding(6)
                                        .background(Color.black)
                                        .foregroundColor(.white)
                                        .clipShape(Circle())

                                    Text(msg.content)
                                        .padding()
                                        .background(Color.blue.opacity(0.2))
                                        .cornerRadius(20)
                                }
                            }

                        }
                    }
                    .padding()
                }



                HStack {
                    TextField("Ask me anything...", text: $textFiledText)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)


                    Button {
                        geminiVM.MsgList
                            .append(
                                MessageModel(content: textFiledText, sender: "user")
                            )
                        Task {
                            await geminiVM.getResponse(message: textFiledText)
                        }
//                        textFiledText = ""
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                }
                .padding()
            }
            .frame(height: 500)
            .frame(maxWidth: .infinity)
            .background(Color.yellow)
            .cornerRadius(20)
            .shadow(radius: 10)
            .transition(.move(edge: .bottom))
        }
    }
}
