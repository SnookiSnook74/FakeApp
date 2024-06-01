//
//  ContentView.swift
//  FakeApp
//
//  Created by DonHalab on 01.06.2024.
//

import SwiftUI

struct DateView: View {
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
    
    var body: some View {
        LazyHStack(spacing: 23.5) {
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
        .frame(maxWidth: .infinity)
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
    let data = [0, 125, 3231, 0, 0, 0, 0, 465]
    // Индекс зеленого стобца
    let highlightedIndex = 2
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 20) {
                ForEach(data.indices, id: \.self) { index in
                    VStack {
                        Text("\(data[index]) ₽")
                            .font(.system(size: 8))
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity)
                        ZStack {
                            DashedLine()
                                .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                .foregroundColor(.gray.opacity(0.5))
                                .frame(height: 200)
                            
                            VStack {
                                Spacer()
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(index == highlightedIndex ? Color.green.opacity(0.8) : Color.gray.opacity(0.5))
                                    .frame(height: CGFloat(data[index]) / 20)
                            }
                        }
                        .frame(maxHeight: 200, alignment: .bottom)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView: View {
    var body: some View {
        VStack(spacing: -500) {
            BarChartView()
            DateView()
        }
        .background(Color(.systemGray6))
    }
}

#Preview {
    ContentView()
}
