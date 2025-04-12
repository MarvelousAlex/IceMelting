//
//  QuestionView2.swift
//  IceMelting
//
//  Created by Wendy Zhou on 12/4/2025.
//

import SwiftUI

struct QuestionView2: View {
    
    @State private var isTappedYes: Bool = false
    @State private var isTappedNo: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.pureWhite.ignoresSafeArea()
                
                ProgressBar(step1Complete: true, step2Complete: true, step3Complete: false)
                    .padding(.bottom, 700)
                
                QustionLabel
                
                AnswerOptions
                
                SendButton
                
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    QuestionView2()
}

extension QuestionView2 {
    
    private var SendLabel: some View {
        Text("SEND")
            .font(.custom("K2D-Bold", size: 18))
            .bold()
            .foregroundColor(.white)
            .frame(width: 360, height: 60)
            .background(isTappedYes || isTappedNo ? Color.black : Color.gray.opacity(0.5))
            .cornerRadius(99)
            .padding(.horizontal)
            .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0), value: isTappedYes || isTappedNo)
    }
    
    private var QustionLabel: some View {
        VStack(alignment: .center, spacing: 0) {
            
            Circle()
                .foregroundStyle(Color.skinYellow)
                .frame(width: 80)
                .overlay {
                    Text("02")
                        .font(.custom("K2D-Bold", size: 36))
                        .foregroundStyle(Color.white)
                }
            
            Spacer().frame(height: 70)
            
            Text("Do you have a job or internship during study?")
                .font(.custom("K2D-Bold", size: 30))
                .background {
                    Image("QuestionBubble")
                }
            
            Spacer().frame(height: 200)
                    
        }
    }
    
    private var AnswerOptions: some View {
        VStack(spacing:10) {
            
            Text("Your Answer")
                .font(.custom("K2D-Bold", size: 25))
            HStack(spacing: 10) {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(isTappedYes ? Color.yesOrNo.opacity(0.5) : Color.yesOrNo)
                    .shadow(radius: 1)
                    .frame(width: 160, height: 160)
                    .overlay {
                        Text("Yes")
                            .font(.custom("K2D-Regular", size: 25))
                    }
                    .onTapGesture {
                        if isTappedYes {
                            // Clear the selection if already active
                            isTappedYes = false
                        } else {
                            // Set Yes active and clear No
                            isTappedYes = true
                            isTappedNo = false
                        }
                    }
                    .animation(.spring(duration: 1), value: isTappedYes)
                
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(isTappedNo ? Color.yesOrNo.opacity(0.5) : Color.yesOrNo)
                    .shadow(radius: 1)
                    .frame(width: 160, height: 160)
                    .overlay {
                        Text("No")
                            .font(.custom("K2D-Regular", size: 25))
                    }
                    .onTapGesture {
                        if isTappedNo {
                            // Clear the selection if already active
                            isTappedNo = false
                        } else {
                            // Set No active and clear Yes
                            isTappedNo = true
                            isTappedYes = false
                        }
                    }
                    .animation(.spring(duration: 1), value: isTappedNo)
            }
        }
        .padding(.top, 400)
    }
    
    private var SendButton: some View {
        NavigationStack {
            NavigationLink(destination: SumView2()) {
                SendLabel
            }
            .disabled(!(isTappedYes || isTappedNo))
            .padding(.top, 700)
        }
    }
    
}
