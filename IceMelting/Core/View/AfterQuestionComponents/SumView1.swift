//
//  SumView1.swift
//  IceMelting
//
//  Created by Wendy Zhou on 12/4/2025.
//

import SwiftUI

struct SumView1: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.pureWhite.ignoresSafeArea()
                VStack(spacing: 10) {
                    
                    // text
                    Text("What do you study?")
                        .font(.custom("K2D-SemiBold", size: 28))
                    
                    Spacer().frame(height: 50)
                    
                    // image
                    Image("MajorCol")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                    
                    Spacer().frame(height: 100)
                    
                    // navi link
                    NavigationLink {
                        QuestionView2()
                    } label: {
                        Text("Next Question")
                            .font(.custom("K2D-SemiBold", size: 20))
                            .foregroundStyle(Color.white)
                            .background {
                                RoundedRectangle(cornerRadius: 36)
                                    .foregroundStyle(Color.black)
                                    .frame(width: 350, height: 60)
                            }
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    SumView1()
}

//extension SumView1 {
//    
//    private var SumText: some View {
//
//    }
//}
