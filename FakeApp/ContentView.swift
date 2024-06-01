//
//  ContentView.swift
//  FakeApp
//
//  Created by DonHalab on 01.06.2024.
//

import SwiftUI

struct CarExpenseRow: View {
    @Binding var car: String
    @Binding var amount: String
    @Binding var percentage: String
    @Binding var carDescript: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                TextField("Автомобиль", text: $car)
                    .font(.headline)
                TextField("", text: $carDescript)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            HStack(spacing: 4) {
                VStack(alignment: .trailing, spacing: 4) {
                    TextField("Сумма", text: $amount)
                        .font(.headline)
                        .frame(width: 50)
                    TextField("Процент", text: $percentage)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .frame(width: 40)
                }
                Button(action: {
                    // Действие для стрелки
                }) {
                    Image(systemName: "chevron.down")
                        .foregroundColor(.blue)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
    }
}


struct ContentView: View {
    @State private var amount: String = "465 ₽"
    @State private var description: String = "Общая сумма расходов за 31.05"
    
    @State private var car1: String = "С 329 АХ 40"
    @State private var amount1: String = "215 ₽"
    @State private var percentage1: String = "46%"
    @State private var carDescript1: String = "(стария)"
    
    @State private var car2: String = "С 480 АС 40"
    @State private var amount2: String = "125 ₽"
    @State private var percentage2: String = "27%"
    @State private var carDescript2: String = "(прадо)"
    
    @State private var car3: String = "У 177 АА 797"
    @State private var amount3: String = "125 ₽"
    @State private var percentage3: String = "27%"
    @State private var carDescript3: String = "(порше 718)"
    
    @State private var car4: String = "Все"
    @State private var amount4: String = "465 ₽"
    @State private var percentage4: String = "100%"
    @State private var carDescript4: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                HeaderView()
                GraphView()
                ExpenseView(amount: $amount, description: $description)
                    .background(Color(.systemGray6))
                VStack(alignment: .leading, spacing: 0) {
                    Text("АВТОМОБИЛЬ")
                        .font(.caption)
                        .padding()
                    Divider()
                    CarExpenseRow(car: $car1, amount: $amount1, percentage: $percentage1, carDescript: $carDescript1)
                    Divider()
                    CarExpenseRow(car: $car2, amount: $amount2, percentage: $percentage2, carDescript: $carDescript2)
                    Divider()
                    CarExpenseRow(car: $car3, amount: $amount3, percentage: $percentage3, carDescript: $carDescript3)
                    Divider()
                    CarExpenseRow(car: $car4, amount: $amount4, percentage: $percentage4, carDescript: $carDescript4)
                }
                .background(Color(.systemGray6))
            }
        }
        .background(Color(.systemGray6))
    }
}

#Preview {
    ContentView()
}
