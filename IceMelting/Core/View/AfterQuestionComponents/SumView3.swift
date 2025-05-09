//
//  SumView3.swift
//  IceMelting
//
//  Created by Wendy Zhou on 12/4/2025.
//

import SwiftUI
import Charts

struct GradeData: Identifiable {
    var id = UUID()
    var grade: String
    var value: Double
    var color: Color
}

let gradeData: [GradeData] = [
    GradeData(grade: "HD", value: 40, color: Color.red.opacity(0.7)),
    GradeData(grade: "Pass", value: 20, color: Color.green.opacity(0.5)),
    GradeData(grade: "D", value: 40, color: Color.yellow.opacity(0.6))
]

struct SumView3: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.pureWhite.ignoresSafeArea()
                VStack(spacing: 10) {
                    Text("What is your\nexpectation to the class?")
                        .font(.custom("K2D-SemiBold", size: 28))
                        .lineLimit(2)

                    Spacer().frame(height: 50)

                    Chart {
                        ForEach(gradeData) { data in
                            SectorMark(
                                angle: .value("Value", data.value),
                                innerRadius: .ratio(0),
                                angularInset: 1
                            )
                            .foregroundStyle(data.color)
                            .annotation(
                                position: .overlay,
                                alignment: .center,
                                spacing: 0
                            ) {
                                Text(data.grade)
                                    .font(.custom("K2D-Bold", size: 30))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .chartBackground { proxy in
                        GeometryReader { geometry in
                            Color.clear
                        }
                    }
                    .frame(width: 300, height: 300)

                    Spacer().frame(height: 100)

                    NavigationLink {
                        WellDoneView()
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
    SumView3()
}
