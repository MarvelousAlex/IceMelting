//
//  QuestionsRowView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 23/4/2025.
//

import SwiftUI

struct QuestionsRowView: View {
    
    let question: Question
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(question.text)
                .foregroundStyle(Color.black)
                .font(.custom("K2D-Bold", size: 25))
        }
    }
}

#Preview {
    QuestionsRowView(
        question: Question(text: "What is a talent or skill you wish you had?")
    )
}
