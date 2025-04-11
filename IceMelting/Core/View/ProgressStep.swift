//
//  ProgressStep.swift
//  IceMelting
//
//  Created by Wendy Zhou on 12/4/2025.
//

import SwiftUI

struct ProgressStep: View {
    
    let isComplete: Bool
    
    var body: some View {
            ZStack {
                // Draw a circle, filled black if complete, white if incomplete
                Circle()
                    .fill(isComplete ? Color.black : Color.white)
                    .frame(width: 24, height: 24)
                    .overlay(
                        Circle()
                            .stroke(Color.black, lineWidth: 2)
                    )
                
                // If complete, show a checkmark; otherwise, a small dot
                if isComplete {
                    Image(systemName: "checkmark")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white)
                } else {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 6, height: 6)
                }
            }
        }
}
