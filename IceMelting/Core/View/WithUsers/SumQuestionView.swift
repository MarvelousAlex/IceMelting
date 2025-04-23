//
//  SumQuestionView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 23/4/2025.
//

import SwiftUI

struct SumQuestionView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = QuestionViewModel()
    @State private var getOpacity: Double = 0.0
    @State private var offsetValue: Double = 300.0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.skinn.ignoresSafeArea()
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(viewModel.questionsList) { question in
                            QuestionsRowView(question: question)
                            .opacity(getOpacity)
                            .offset(y: offsetValue)
                            .onAppear {
                                withAnimation(.spring(duration: 5)) {
                                    getOpacity = 1
                                    offsetValue = 0
                                }
                            }
                    }
                    Spacer()
                }
                .padding()
            }
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
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    SumQuestionView()
}

