//
//  QuestionView3.swift
//  IceMelting
//
//  Created by Wendy Zhou on 12/4/2025.
//

import SwiftUI

struct QuestionView3: View {

    enum GradeOption: String, CaseIterable, Identifiable {
        case highDistinction = "High Distinction"
        case distinction = "Distinction"
        case credit = "Credit"
        case pass = "Pass"

        var id: String { rawValue }
    }

    @State private var selection: GradeOption?

    var body: some View {
        NavigationStack {
            ZStack {
                Color.pureWhite.ignoresSafeArea()
                VStack(alignment: .center, spacing: 15) {
                    ProgressBar(step1Complete: true, step2Complete: true, step3Complete: true)
                    Spacer().frame(height: 30)
                    Circle()
                        .foregroundStyle(Color.skinYellow)
                        .frame(width: 80)
                        .overlay {
                            Text("03")
                                .font(.custom("K2D-Bold", size: 36))
                                .foregroundStyle(Color.white)
                        }

                    Text("What is your\nexpectation to the class?")
                        .padding()
                        .font(.custom("K2D-Bold", size: 28))
                        .frame(width: 360, height: 140)
                        .frame(alignment: .center)
                        .background {
                            Image("QuestionBubble")
                        }

                    // Options
                    VStack(spacing: 10) {
                        ForEach(GradeOption.allCases) { option in
                            Text(option.rawValue)
                                .font(.custom("K2D-Regular", size: 20))
                                .frame(width: 360, height: 60)
                                .background {
                                    RoundedRectangle(cornerRadius: 99)
                                        .foregroundStyle(selection == option ? Color.blue : Color.yesOrNo)
                                }
                                .foregroundColor(selection == option ? .white : .black)
                                .onTapGesture {
                                    withAnimation(.spring(duration: 1)) {
                                        selection = option
                                    }
                                }
                        }
                    }

                    Spacer().frame(height: 30)

                    NavigationLink {
                        GreatAnswerView3()
                    } label: {
                        Text("SEND")
                            .font(.custom("K2D-Bold", size: 18))
                            .bold()
                            .foregroundColor(.white)
                            .frame(width: 360, height: 60)
                            .background(Color.black)
                            .cornerRadius(99)
                            .padding(.horizontal)
                    }
                    .disabled(selection == nil)
                    .opacity(selection == nil ? 0.5 : 1)
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    QuestionView3()
}
