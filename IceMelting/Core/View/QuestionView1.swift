//
//  QuestionView1.swift
//  IceMelting
//
//  Created by Wendy Zhou on 12/4/2025.
//

import SwiftUI

struct QuestionView1: View {
    var body: some View {
        NavigationStack {
            ProgressBar(step1Complete: true, step2Complete: false, step3Complete: false)
        }
    }
}

#Preview {
    QuestionView1()
}
