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
            MainComponents
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        MainView()
                    } label: {
                        LeaveButtonText
                    }
                }
            }
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
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(TheName.isEmpty ? Color.gray.opacity(0.5) : Color.black)
            .cornerRadius(99)
            .padding(.horizontal)
    }
    
    private var NameEnteringComponents: some View {
        VStack(spacing: 10) {
            
            HStack(spacing:0) {
                Text("Enter Your ")
                    .font(.custom("K2D-Regular", size: 18))
                Text("Name")
                    .font(.custom("K2D-SemiBold", size: 18))
            }
            
            TextField("", text: $TheName)
                .padding(.horizontal, 15)
                .frame(width: 360, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 60)
                        .foregroundStyle(Color.skinn)
                )
                .padding(.horizontal)
        }
    }
    
    private var MainComponents: some View {
        ZStack {
            Color.pureWhite.ignoresSafeArea()
                Image("NameImg1")
                    .resizable()
                    .frame(width: 400, height: 612)
                    .padding(.bottom, 60)
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
