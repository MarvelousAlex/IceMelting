//
//  ProgressBar.swift
//  IceMelting
//
//  Created by Wendy Zhou on 11/4/2025.
//

import SwiftUI

struct ProgressBar: View {
    
    let step1Complete: Bool
    let step2Complete: Bool
    let step3Complete: Bool
    
    var body: some View {
            HStack(spacing: 0) {
                // Step 1
                ProgressStep(isComplete: step1Complete)
                connectingLine
                
                // Step 2
                ProgressStep(isComplete: step2Complete)
                connectingLine
                
                // Step 3
                ProgressStep(isComplete: step3Complete)
            }
            .padding(.horizontal, 45)
        }
        
    private var connectingLine: some View {
            Rectangle()
                .fill(Color.gray)
                .frame(height: 2)
                .frame(maxWidth: .infinity)
        }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            // Example: Only the first step is complete
            ProgressBar(step1Complete: true, step2Complete: false, step3Complete: false)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
