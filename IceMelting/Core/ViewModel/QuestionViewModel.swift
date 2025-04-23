//
//  QuestionViewModel.swift
//  IceMelting
//
//  Created by Wendy Zhou on 23/4/2025.
//

import Foundation
import Combine

class QuestionViewModel: ObservableObject {
    
    @Published var questionsList: [Question] = questions

    init() {
        self.questionsList = questions
    }
}
