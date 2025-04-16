//
//  NameView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 9/4/2025.
//

import SwiftUI

struct NameView: View {
    
    @State private var TheName: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.pureWhite.ignoresSafeArea()
                Image("NameImg1").offset(y: -65)
                VStack(alignment: .center, spacing: 10) {
                    HStack(spacing:0) {
                        Text("Enter Your ")
                            .font(.custom("K2D-Regular", size: 22))
                        Text("Name🫶🏻")
                            .font(.custom("K2D-SemiBold", size: 22))
                    }
                    .foregroundStyle(Color.black)
                    
                    TextField("", text: $TheName)
                        .padding(.horizontal, 15)
                        .foregroundStyle(Color.white)
                        .frame(width: 360, height: 60)
                        .background{
                            RoundedRectangle(cornerRadius: 60)
                                .foregroundStyle(Color.yesOrNo)
                        }
                        .padding(.horizontal)
//                    Spacer().frame(height: 400)
                    Group {
                        if TheName.isEmpty {
                            SendLabel
                        } else {
                            NavigationLink {
                                QuestionView1()
                            } label: {
                                SendLabel
                            }
                        }
                    }.offset(y: 300)
                        
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        PlayView()
                    } label: {
                        LeaveButtonText
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    NameView()
}

extension NameView {
    
    private var SendLabel: some View {
        Text("SEND")
            .font(.custom("K2D-Bold", size: 18))
            .bold()
            .foregroundColor(.white)
            .frame(width: 360, height: 60)
//            .background(TheName.isEmpty ? Color.gray.opacity(0.8) : Color.black)
            .background {
                RoundedRectangle(cornerRadius: 60)
                    .foregroundStyle(TheName.isEmpty ? Color.black.opacity(0.3): Color.black)
            }
            .padding(.horizontal)
    }
    
    private var NameEnteringComponents: some View {
        VStack(spacing: 10) {
            
            HStack(spacing:0) {
                Text("Enter Your ")
                    .font(.custom("K2D-Regular", size: 22))
                Text("Name")
                    .font(.custom("K2D-SemiBold", size: 22))
            }
            .foregroundStyle(Color.black)
            
            TextField("", text: $TheName)
                .padding(.horizontal, 15)
                .frame(width: 360, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 60)
//                        .foregroundStyle(Color.skinn)
                        .opacity(0.2)
                )
                .padding(.horizontal)
        }
    }
    
    private var MainComponents: some View {
        ZStack {
            Color.pureWhite.ignoresSafeArea()
            Image("NameImg1").offset(y: -65)
            if TheName.isEmpty {
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
            
            NameEnteringComponents // Enter your name and the text field
            
        }
    }
    
    private var LeaveButtonText: some View {
        Text("Leave")
            .font(.custom("K2D-SemiBold", size: 14))
            .foregroundStyle(Color.black)
            .padding(.trailing, 15)
    }
    
}
