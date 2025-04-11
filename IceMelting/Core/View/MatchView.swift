//
//  MatchView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 28/3/2025.
//

import SwiftUI

struct MatchView: View {
    
    @State private var CodeNum: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack{
                
                Color.skinYellow.ignoresSafeArea()
                
                BGImage // Shapes at the background
                
                HeadTitles // Play, Match, Enjoy components
                
                CodeEnterSpace // Enter The Code components
                
            }
        }
    }
}

#Preview {
    MatchView()
}

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
            Spacer()
        }.offset(x: -10)
    }
    
    private var CodeEnterSpace: some View {
        VStack(spacing:10) {
            Spacer().frame(height: 500)
            Text("Enter The Code")
                .font(.custom("K2D-SemiBold", size: 24))
            HStack(spacing: 20) {
                TextField("", text: $CodeNum)
                    .padding(15)
                    .frame(height: 50)
                    .background {
                        RoundedRectangle(cornerRadius: 16).opacity(0.2)
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
            .resizable()
            .frame(width: 410, height: 530)
            .padding(.top, 40)
    }
    
    private var EnterLabel: some View {
        Text("Enter")
            .font(.custom("K2D-Bold", size: 20))
            .foregroundStyle(Color.white)
            .padding()
            .frame(height: 50)
            .background(CodeNum.isEmpty ? Color.gray.opacity(0.5) : Color.black)
            .cornerRadius(16)
    }
    
}
