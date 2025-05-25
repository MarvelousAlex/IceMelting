//
//  ChatView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 28/3/2025.
//

import SwiftUI

struct ChatView: View {

    @State private var searchText: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                // Title
                Text("Messages")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)

                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                    ZStack(alignment: .leading) {
                        if searchText.isEmpty {
                            Text("Search")
                                .foregroundColor(.white)
                        }
                        TextField("", text: $searchText)
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(30)
                .padding(.horizontal)

                // Chat List
                List {
                    Section(header: Text("Chat")) {
                        NavigationLink(destination: ChatDemoView()){
                                ChatRowView(name: "Jeff", status: "new messages", imageName: "profile1", hasNewMessage: true)
                            }
                            .listRowInsets(EdgeInsets())
                        ChatRowView(name: "Tom", status: "Active xx ago", imageName: "profile2")
                            .listRowInsets(EdgeInsets())
                        ChatRowView(name: "Kate", status: "Active xx ago", imageName: "profile3")
                            .listRowInsets(EdgeInsets())
                        ChatRowView(name: "Joe", status: "Active xx ago", imageName: "profile4")
                            .listRowInsets(EdgeInsets())
                        ChatRowView(name: "Cindy", status: "Active xx ago", imageName: "profile5")
                            .listRowInsets(EdgeInsets())
                        ChatRowView(name: "Ian", status: "Active xx ago", imageName: "profile6")
                            .listRowInsets(EdgeInsets())
                        ChatRowView(name: "Tina", status: "Active xx ago", imageName: "profile7")
                            .listRowInsets(EdgeInsets())
                    }
                }
                .listStyle(PlainListStyle())

                // Bottom Navigation
                HStack {
                    TabButton(icon: "Profile", label: "Profile")
                    Spacer()
                    TabButton(icon: "Match", label: "Match")
                    Spacer()
                    TabButton(icon: "Insight", label: "Insight")
                    Spacer()
                    TabButton(icon: "Message", label: "Message", isSelected: true)
                }
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(30)
                .padding(.horizontal)
            }
            .background(Color(red: 250/255, green: 242/255, blue: 231/255))
        }
    }
}

struct ChatRowView: View {
    var name: String
    var status: String
    var imageName: String
    var hasNewMessage: Bool = false

    var body: some View {
        HStack {
            // Profile Image Placeholder
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray.opacity(0.3), lineWidth: 1))

            VStack(alignment: .leading) {
                Text(name)
                    .fontWeight(.bold)
                if hasNewMessage {
                    Text(status)
                        .foregroundColor(.red)
                        .font(.caption)
                } else {
                    Text(status)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }

            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
        .frame(maxWidth: .infinity)
        .background(Color(red: 250/255, green: 242/255, blue: 231/255))
    }

}

struct TabButton: View {
    var icon: String
    var label: String
    var isSelected: Bool = false

    var body: some View {
        VStack {
            Image(icon)
            Text(label)
                .font(.caption)
        }
        .foregroundColor(isSelected ? Color(red: 242/255, green: 176/255, blue: 222/255) : .white)
    }
}


#Preview {
    ChatView()
}

