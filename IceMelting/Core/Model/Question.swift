//
//  Question.swift
//  IceMelting
//
//  Created by Wendy Zhou on 23/4/2025.
//

import Foundation

struct Question: Identifiable, Codable {
    var id = UUID()
    let text: String
}

let questions: [Question] = [
    Question(text: "1. What do you study?"),
    Question(text: "2. Do you have a job or internship during study?"),
    Question(text: "3. What is your expectation to the class?"),
]
