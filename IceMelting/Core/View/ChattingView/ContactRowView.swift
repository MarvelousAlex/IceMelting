//
//  ContactRowView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 24/4/2025.
//

import SwiftUI

struct ContactRowView: View {
    let contact: Contact

    var body: some View {
        HStack(spacing: 12) {
            Image(contact.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(contact.hasNewMessages ? Color.red : Color.clear, lineWidth: 2)
                )

            VStack(alignment: .leading, spacing: 4) {
                Text(contact.name)
                    .font(.system(size: 18, weight: .semibold))
                Text(contact.subtitle)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
    }
}
