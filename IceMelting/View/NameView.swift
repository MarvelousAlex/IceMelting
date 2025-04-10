//
//  NameView.swift
//  IceMelting
//
//  Created by Wendy Zhou on 9/4/2025.
//

import SwiftUI

struct NameView: View {
    
    // State variables for text fields or other UI elements
    @State private var name: String = ""
    
    var body: some View {
        ZStack {
            // 1. Background color
            Color.nameViewBGC
                .ignoresSafeArea()
            
            // 2. Decorative elements in the background
            //    These can be images, shapes, or custom SwiftUI views
            ZStack {
                // Example Spark image
                Image("NameViewSpark")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
                    // Dim or shift the position to taste
//                    .opacity(0.2)
                    .offset(x: 100, y: -280)
                    .ignoresSafeArea()
                
                // Example geometric shape (rectangle) in background
                Image("Triangles")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .offset(x: -120, y: -20)
            }
            
            // 3. Main content in the foreground
            VStack(spacing: 20) {
                
                Text("Enter Your Name")
                    .font(.title)
                    .foregroundColor(.black)
                
                TextField("", text: $name)
                    .padding(.horizontal, 15)
                    .frame(height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                    )
                    .padding(.horizontal)
                
                Button(action: {
                    // Handle the send action here
                }) {
                    Text("SEND")
                        .font(.system(.title3, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.black)
                        .cornerRadius(25)
                        .padding(.horizontal)
                }
            }
            // Add additional spacing or alignment as needed
        }
    }
}

#Preview {
    NameView()
}

extension NameView {
    private var SendLabel: some View {
        Text("Send")
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
