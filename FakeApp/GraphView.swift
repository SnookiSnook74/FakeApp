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
    @Binding var data: [Int]
    @Binding var highlightedIndex: Int
    @State private var showEditSheet = false
    @State private var newAmount: String = ""
    
    private var maxValue: Int {
        data.max() ?? 1
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 15) {
                ForEach(data.indices, id: \.self) { index in
                    VStack {
                        Text("\(data[index]) ₽")
                            .font(.system(size: 7.5))
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity)
                            .onTapGesture {
                                highlightedIndex = index
                                newAmount = "\(data[index])"
                                showEditSheet = true
                            }
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
                    }
                }
            }
        }
        .frame(maxWidth: 380, maxHeight: 230)
        .sheet(isPresented: $showEditSheet) {
            VStack {
                Text("Исправить сумму")
                    .font(.headline)
                TextField("Вводи новую сумму", text: $newAmount)
                    .keyboardType(.numberPad)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack {
                    Button("Выйти") {
                        showEditSheet = false
                    }
                    .padding()
                    Spacer()
                    Button("Сохранить") {
                        if let amount = Int(newAmount) {
                            data[highlightedIndex] = amount
                        }
                        showEditSheet = false
                    }
                    .padding()
                }
            }
            .padding()
        }
    }
}

struct GraphView: View {
    @State private var data = [0, 3231, 0, 0, 0, 0, 465, 3635]
    @State private var highlightedIndex: Int = 7
    
    var body: some View {
        VStack(spacing: 0) {
            BarChartView(data: $data, highlightedIndex: $highlightedIndex)
            DateView(dates: generateDates())
        }
        .background(Color(.systemGray6))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func generateDates() -> [(String, String)] {
        var dates = [(String, String)]()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "E"
        dayFormatter.locale = Locale(identifier: "ru_RU")
        
        for i in 0..<8 {
            if let date = Calendar.current.date(byAdding: .day, value: -i, to: Date()) {
                let dateString = dateFormatter.string(from: date)
                let dayString = dayFormatter.string(from: date).capitalized
                dates.append((dateString, dayString))
            }
        }
        
        return dates.reversed()
    }
}

#Preview {
    ContentView()
}
