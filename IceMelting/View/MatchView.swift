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
        ZStack{
            Color.matchBackground.ignoresSafeArea()
            VStack(spacing: 40) {
                Text("Join the Match Game")
                    .font(.system(size: 30, design: .rounded))
                
                Image("MatchingPic")
                
                Text("Enter The Code")
                    .font(.system(size: 20, design: .rounded))
                
                HStack(spacing: 20) {
                    TextField("", text: $CodeNum)
                        .padding(15)
                        .frame(height: 50)
                        .background {
                            RoundedRectangle(cornerRadius: 20).opacity(0.2)
                        }
                    Button {
                        
                    } label: {
                        buttonSession
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer().frame(height: 150)
            }
        }
    }
}

#Preview {
    MatchView()
}

extension MatchView {
    private var buttonSession: some View {
        Text("Enter")
            .font(.custom("Nunito-Regular", size: 20))
            .foregroundStyle(Color.white)
            .padding()
            .frame(height: 50)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(Color.black)
            }
    }
}
