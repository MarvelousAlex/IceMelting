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
        VStack(alignment: .leading, spacing: 16) {
            // Header
            Text("Messages")
                .font(.largeTitle).bold()
                .padding(.horizontal)
            
            // Search bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search", text: $viewModel.searchText)
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
                .font(.headline)
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
                        }
                    }
                }
            }
        }
        .navigationTitle("Chat")
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatView()
        }
    }
}
