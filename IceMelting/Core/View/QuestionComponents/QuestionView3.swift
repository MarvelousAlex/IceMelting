//
//  QuestionView3.swift
//  IceMelting
//
//  Created by Wendy Zhou on 12/4/2025.
//

import SwiftUI

struct QuestionView3: View {
    
    @State private var isHD: Bool = false
    @State private var isD: Bool = false
    @State private var isCredit: Bool = false
    @State private var isPass: Bool = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.pureWhite.ignoresSafeArea()
                
                ProgressBar(step1Complete: true, step2Complete: true, step3Complete: true)
                    .padding(.bottom, 700)
                
                VStack(alignment: .center, spacing: 15) {
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
                
                    HD_Option
                    D_Option
                    C_Option
                    Pass_Option
                    
                }
                
                SendLabel
                    .padding(.top, 700)
                
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    QuestionView3()
}

extension QuestionView3 {
    private var SendLabel: some View {
        Text("SEND")
            .font(.custom("K2D-Bold", size: 18))
            .bold()
            .foregroundColor(.white)
            .frame(width: 360, height: 60)
            .background(Color.black)
            .cornerRadius(99)
            .padding(.horizontal)
    }
    
    private var HD_Option: some View {
        Text("High Distinction")
            .font(.custom("K2D-Regular", size: 18))
            .frame(width: 360, height: 60)
            .background {
                RoundedRectangle(cornerRadius: 99)
                    .foregroundStyle(isHD ? Color.blue : Color.yesOrNo)
            }
            .onTapGesture {
                isHD.toggle()
            }
            .animation(.spring(duration: 1), value: isHD)
    }
    
    private var D_Option: some View {
        Text("Distinction")
            .font(.custom("K2D-Regular", size: 18))
            .frame(width: 360, height: 60)
            .background {
                RoundedRectangle(cornerRadius: 99)
                    .foregroundStyle(isD ? Color.blue : Color.yesOrNo)
            }
            .onTapGesture {
                isD.toggle()
            }
            .animation(.spring(duration: 1), value: isD)
    }
    
    private var C_Option: some View {
        Text("Credit")
            .font(.custom("K2D-Regular", size: 18))
            .frame(width: 360, height: 60)
            .background {
                RoundedRectangle(cornerRadius: 99)
                    .foregroundStyle(isCredit ? Color.blue : Color.yesOrNo)
            }
            .onTapGesture {
                isCredit.toggle()
            }
            .animation(.spring(duration: 1), value: isCredit)
    }
    
    private var Pass_Option: some View {
        Text("Pass")
            .font(.custom("K2D-Regular", size: 18))
            .frame(width: 360, height: 60)
            .background {
                RoundedRectangle(cornerRadius: 99)
                    .foregroundStyle(isPass ? Color.blue : Color.yesOrNo)
            }
            .onTapGesture {
                isPass.toggle()
            }
            .animation(.spring(duration: 1), value: isPass)
    }
}
