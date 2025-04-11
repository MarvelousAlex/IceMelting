//
//  QuestionView1.swift
//  IceMelting
//
//  Created by Wendy Zhou on 12/4/2025.
//

import SwiftUI

struct QuestionView1: View {
    @State private var TheAns: String = ""
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.pureWhite.ignoresSafeArea()
                
                ProgressBar(step1Complete: true, step2Complete: false, step3Complete: false)
                    .padding(.bottom, 700)
                VStack {
                    
                    Text("Your Answer")
                        .font(.custom("K2D-SemiBold", size: 20))
                    TextField("", text: $TheAns)
                        .padding(.leading, 15)
                        .frame(width: 360, height: 60)
                        .background {
                            RoundedRectangle(cornerRadius: 60)
                                .opacity(0.1)
                            // .foregroundStyle(Color.textBox)
//                                .opacity(0.5)
                        }
                }
                .padding(.top, 500)
                
                if TheAns.isEmpty {
                    SendLabel
                        .padding(.top, 700)
                } else {
                    NavigationLink {
                        QuestionView1()
                    } label: {
                        SendLabel
                    }
                    .padding(.top, 700)
                }
                
                VStack(spacing: 0) {
                    
                    Circle()
                        .foregroundStyle(Color.skinYellow)
                        .frame(width: 80)
                        .overlay {
                            Text("01")
                                .font(.custom("K2D-Bold", size: 36))
                                .foregroundStyle(Color.white)
                        }
                    
                    Spacer().frame(height: 70)
                    
                    Text("What do you study?") // what is your major?
                        .font(.custom("K2D-Bold", size: 30))
                        .background {
                            Image("QuestionBubble")
                        }
                    
                    Spacer().frame(height: 200)
                            
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
}
