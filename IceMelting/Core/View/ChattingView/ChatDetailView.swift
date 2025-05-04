//
//  ChatDetailView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 24/4/2025.
//

import SwiftUI

struct ChatDetailView: View {
    @StateObject private var viewModel: ChatDetailViewModel
    @Environment(\.dismiss) var dismiss

    init(contact: Contact) {
        _viewModel = StateObject(wrappedValue: ChatDetailViewModel(contact: contact))
    }
    
    var body: some View {
        VStack {
            // Top bar
            HStack {
                Button {
                    // pop back
                    // in a NavigationView, this will auto-go back
                    // or you could use environment(\.presentationMode) to dismiss
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        
                }
                Text(viewModel.contact.name)
                    
                Spacer()
            }
            .font(.custom("K2D-Bold", size: 20))
            .foregroundStyle(Color.black)
            .padding()
            
            Text("Today")
                .font(.caption)
                .foregroundColor(.gray)
            
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.messages) { msg in
                        HStack {
                            if msg.isCurrentUser { Spacer() }
                            Text(msg.text)
                                .padding()
                                .background(msg.isCurrentUser ? Color.yellow : Color.gray.opacity(0.2))
                                .cornerRadius(16)
                                .frame(maxWidth: UIScreen.main.bounds.width * 0.7, alignment: msg.isCurrentUser ? .trailing : .leading)
                            if !msg.isCurrentUser { Spacer() }
                            
                            // avatar
                            if msg.isCurrentUser {
                                Image("JasonAvatar")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 36, height: 36)
                                    .clipShape(Circle())
                            } else {
                                Image(viewModel.contact.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 36, height: 36)
                                    .clipShape(Circle())
                            }
                        }
                        .font(.custom("K2D-Bold", size: 15))
                        .padding(.horizontal)
                    }
                }
            }
            
            // Input bar
            HStack {
                TextField("", text: $viewModel.newMessage)
                    .padding(12)
                    .background(content: {
                        Color.black
                    })
                    .cornerRadius(25)
                
                Button {
                    viewModel.sendMessage()
                } label: {
                    Image(systemName: "paperplane.fill")
                        .rotationEffect(.degrees(45))
                        .font(.title2)
                }
                .padding(.leading, 8)
            }
            .padding()
        }
        .navigationBarHidden(true)
        .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all))
    }
}

struct ChatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatDetailView(contact: Contact(name: "Jeff", imageName: "JeffAvatar", subtitle: "new messages", hasNewMessages: true))
        }
    }
}
