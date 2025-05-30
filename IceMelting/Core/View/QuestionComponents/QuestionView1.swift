//
//  QuestionView1.swift
//  IceMelting
//
//  Created by Wendy Zhou on 12/4/2025.
//

import SwiftUI

struct QuestionView1: View {

    @State private var TheAns: String = ""
    @State private var keyboardHeight: CGFloat = 0

    var body: some View {
        NavigationStack {
            ZStack {

                Color.pureWhite.ignoresSafeArea()

                ProgressBar(step1Complete: true, step2Complete: false, step3Complete: false)
                    .padding(.bottom, 700)

                VStack(spacing: 0) {

                    Spacer()

                    QuestionNumber // 01

                    Spacer().frame(height: 70)

                    QuestionText // what do you study?

                    Spacer().frame(height: 200)

                    AnswerText // Your Answer
                        .padding(.bottom, 20)

                    if TheAns.isEmpty {
                        SendLabel
                    } else {
                        NavigationLink {
                            GreatAnswerView()
                        } label: {
                            SendLabel
                        }
                    }

                }
            }
            .padding(.bottom, keyboardHeight)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .onAppear {
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notif in
                    if let frame = notif.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                        keyboardHeight = frame.height
                    }
                }
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                    keyboardHeight = 0
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    QuestionView1()
}

extension QuestionView1 {

    private var SendLabel: some View {
        Text("SEND")
            .font(.custom("K2D-Bold", size: 18))
            .bold()
            .foregroundColor(.white)
            .frame(width: 360, height: 60)
            .background(TheAns.isEmpty ? Color.gray.opacity(0.5) : Color.black)
            .cornerRadius(99)
            .padding(.horizontal)
    }

    private var QuestionNumber: some View {
        Circle()
            .foregroundStyle(Color.skinYellow)
            .frame(width: 80)
            .overlay {
                Text("01")
                    .font(.custom("K2D-Bold", size: 36))
                    .foregroundStyle(Color.white)
            }
    }

    private var QuestionText: some View {
//        Text("What do you like to do\nwhen you’re not studying?")
        Text("What do you study?") // what is your major?
            .font(.custom("K2D-Bold", size: 30))
            .foregroundStyle(Color.black)
            .background {
                Image("QuestionBubble")
            }
    }

    private var AnswerText: some View {
        VStack {
            Text("Your Answer")
                .font(.custom("K2D-SemiBold", size: 20))
                .foregroundStyle(Color.black)
            TextField("", text: $TheAns)
                .padding(.leading, 15)
                .frame(width: 360, height: 60)
                .foregroundStyle(Color.black)
                .background {
                    RoundedRectangle(cornerRadius: 60)
                        .opacity(0.1)
                        .foregroundStyle(Color.black)
                }
        }
    }

}
