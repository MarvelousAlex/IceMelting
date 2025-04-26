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
            VStack(alignment: .leading, spacing: 4) {
                Text(contact.name)
                    .font(.custom("K2D-SemiBold", size: 20))
                Text(contact.subtitle)
                    .font(.custom("K2D-SemiBold", size: 14))
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
    }
}
