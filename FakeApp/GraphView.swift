//
//  GraphView.swift
//  FakeApp
//
//  Created by DonHalab on 01.06.2024.
//

import SwiftUI

struct DateView: View {
    let dates: [(String, String)]
    
    var body: some View {
        LazyHStack(spacing: 22.5) {
            ForEach(dates, id: \.0) { date in
                VStack {
                    Text(date.0)
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                    Text(date.1)
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: 30)
    }
}

struct DashedLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        return path
    }
}

struct BarChartView: View {
    let data: [Int]
    @Binding var highlightedIndex: Int
    
    private var maxValue: Int {
        data.max() ?? 1
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 20) {
                ForEach(data.indices, id: \.self) { index in
                    VStack {
                        Text("\(data[index]) ₽")
                            .font(.system(size: 7.5))
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity)
                        ZStack {
                            DashedLine()
                                .stroke(style: StrokeStyle(lineWidth: 1, dash: [8]))
                                .foregroundColor(.gray.opacity(0.5))
                                .frame(height: 200)
                            
                            VStack {
                                Spacer()
                                if index == highlightedIndex {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(LinearGradient(
                                            gradient: Gradient(colors: [Color.green.opacity(0.0), Color.green.opacity(0.8)]),
                                            startPoint: .bottom,
                                            endPoint: .top
                                        ))
                                        .frame(height: CGFloat(data[index]) / CGFloat(maxValue) * 200)
                                } else {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(LinearGradient(
                                            gradient: Gradient(colors: [Color.gray.opacity(0.0), Color.gray.opacity(0.8)]),
                                            startPoint: .bottom,
                                            endPoint: .top
                                        ))
                                        .frame(height: CGFloat(data[index]) / CGFloat(maxValue) * 200)
                                }
                            }
                        }
                        .frame(maxHeight: 200, alignment: .bottom)
                        .onTapGesture {
                            highlightedIndex = index
                        }
                    }
                }
            }
        }
        .frame(maxWidth: 380, maxHeight: 230)
    }
}

struct GraphView: View {
    let data = [0, 125, 3231, 0, 0, 0, 0, 5000]
    let dates = [
            ("24.05", "ПТ"),
            ("25.05", "СБ"),
            ("26.05", "ВС"),
            ("27.05", "ПН"),
            ("28.05", "ВТ"),
            ("29.05", "СР"),
            ("30.05", "ЧТ"),
            ("31.05", "ПТ")
        ]
    
    @State private var highlightedIndex: Int = 7
    
    var body: some View {
        VStack(spacing: 0) {
            BarChartView(data: data, highlightedIndex: $highlightedIndex)
            DateView(dates: dates)
        }
        .background(Color(.systemGray6))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
