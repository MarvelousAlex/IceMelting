//
//  MatchView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 28/3/2025.
//

import SwiftUI
import Combine
import UIKit

struct MatchView: View {

    var onUserSelected: (Users) -> Void
    @State private var CodeNum: String = ""
    @State private var keyboardHeight: CGFloat = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.skinYellow.ignoresSafeArea()
                BGImage.offset(y: -30)
                VStack {
                    HeadTitles.offset(y: -250)
                    CodeEnterSpace.offset(y: 100)
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

//#Preview {
//    MatchView()
//}

extension MatchView {
    
    private var HeadTitles: some View {
        VStack(alignment: .leading) {
            Text("Play,")
                .font(.custom("K2D-Light", size: 55))
            HStack{
                Text("Match, ")
                    .font(.custom("K2D-SemiBold", size: 55))
                Text("Enjoy.")
                    .font(.custom("K2D-Light", size: 55))
            }
            Text("Join the Match Game!")
                .font(.custom("K2D-Light", size: 20))
        }
        .foregroundStyle(Color.black)
        .offset(x: -10)
    }
    
    private var CodeEnterSpace: some View {
        VStack(spacing:10) {
            Text("Enter The Code")
                .foregroundStyle(Color.black)
                .font(.custom("K2D-SemiBold", size: 24))
            HStack(spacing: 20) {
                TextField("", text: $CodeNum)
                    .padding(15)
                    .frame(height: 50, alignment: .center)
                    .foregroundColor(.black)
                    .background {
                        RoundedRectangle(cornerRadius: 16).opacity(0.8)
                            .foregroundStyle(Color.gray.opacity(0.3))
                    }
                if !CodeNum.isEmpty {
                    NavigationLink {
                        NameView()
                    } label: {
                        EnterLabel
                    }
                } else {
                    EnterLabel
                }
            }
            .padding(.horizontal, 40)
        }
    }
    
    private var BGImage: some View {
        Image("MatchImg")
            .frame(width: 410, height: 480)
    }
    
    private var EnterLabel: some View {
        Text("Go💨")
            .font(.custom("K2D-Bold", size: 20))
            .foregroundStyle(Color.white)
            .padding()
            .frame(height: 50)
            .background(CodeNum.isEmpty ? Color.gray.opacity(0.3) : Color.black)
            .cornerRadius(16)
    }
    
}
