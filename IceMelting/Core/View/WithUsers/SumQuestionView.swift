//
//  SumQuestionView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 23/4/2025.
//

import SwiftUI

struct SumQuestionView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.skinn.ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                Text("What do you study?")
                Text("Do you have a job or internship during study?")
                Text("What is your expectation to the class?")
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Questions")
                                .font(.custom("K2D-Bold", size: 24))
                        }
                        .foregroundStyle(Color.black)
                    }
                }
            }
        }
    }
}

#Preview {
    SumQuestionView()
}
