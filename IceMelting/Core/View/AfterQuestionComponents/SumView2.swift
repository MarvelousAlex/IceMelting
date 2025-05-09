//
//  SumView2.swift
//  IceMelting
//
//  Created by Wendy Zhou on 12/4/2025.
//

import SwiftUI
import Charts

struct VoteData: Identifiable {
    var id = UUID()
    var option: String
    var count: Int
    var color: Color
}

let sampleData = [
    VoteData(option: "Yes", count: 13, color: Color.pinkk),
    VoteData(option: "No", count: 21, color: Color.littleBlue)
]

struct SumView2: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.pureWhite.ignoresSafeArea()
                VStack(spacing: 10) {
                    Text("Do you have a job or \ninternship during study?")
                        .font(.custom("K2D-SemiBold", size: 28))
                        .lineLimit(2)

                    Spacer().frame(height: 50)

                    Chart {
                        ForEach(sampleData) { data in
                            BarMark(
                                x: .value("Option", data.option),
                                y: .value("Count", data.count)
                            )
                            .foregroundStyle(data.color)
                            .cornerRadius(10) // round top of bar
                            .annotation(position: .top) {
                                Text("\(data.count)")
                                    .font(.custom("K2D-SemiBold", size: 16))
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .chartYAxis(.hidden)
                    .frame(height: 300)
                    .padding()

                    Spacer().frame(height: 100)

                    NavigationLink {
                        QuestionView3()
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
        }

    }
}

#Preview {
    SumView2()
}
