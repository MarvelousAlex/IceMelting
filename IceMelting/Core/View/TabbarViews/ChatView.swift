//
//  ChatView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 28/3/2025.
//

import SwiftUI

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    
    var body: some View {
        ZStack {
            Color.skinn.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 10) {
                
                // Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search", text: $viewModel.searchText)
                        .foregroundStyle(Color.white)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                .padding(10)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(25)
                .padding(.horizontal)
                
                // Subheader
                Text("Chat")
                    .font(.custom("K2D-Bold", size: 25))
                    .padding(.horizontal)
                
                // Contact list
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.contacts.filter { contact in
                            viewModel.searchText.isEmpty
                            ? true
                            : contact.name.localizedCaseInsensitiveContains(viewModel.searchText)
                        }) { contact in
                            NavigationLink(destination: ChatDetailView(contact: contact)) {
                                ContactRowView(contact: contact)
                                    .foregroundStyle(Color.black)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Messages")
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatView()
        }
    }
}
