//
//  CheckboxToggleStyle.swift
//  IceMelting
//
//  Created by Wendy Zhou on 16/4/2025.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            // Toggle the Boolean binding when the button is tapped
            configuration.isOn.toggle()
        }) {
            HStack {
                // Display a checkmark when isOn is true, otherwise show an empty square.
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .imageScale(.large)
                    .foregroundColor(configuration.isOn ? .black : .secondary)
                
                // Include the original label passed to the Toggle
                configuration.label
            }
        }
        .buttonStyle(PlainButtonStyle()) // Remove the default button styling
    }
}

extension ToggleStyle where Self == CheckboxToggleStyle {
    static var checkbox: CheckboxToggleStyle { CheckboxToggleStyle() }
}
