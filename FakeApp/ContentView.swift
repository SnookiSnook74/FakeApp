//
//  ContentView.swift
//  FakeApp
//
//  Created by DonHalab on 01.06.2024.
//

import SwiftUI

struct CarExpenseRow: View {
    let car: String
    let amount: Int
    let percentage: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(car)
                    .font(.headline)
                Text("(машина)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 4) {
                Text("\(amount) ₽")
                    .font(.headline)
                Text("\(percentage)%")
                    .font(.subheadline)
                    .foregroundColor(.gray)
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
                        .padding(15)
                    Divider()
                    CarExpenseRow(car: "С 329 АХ 40", amount: 215, percentage: 46)
                    Divider()
                    CarExpenseRow(car: "С 480 АС 40", amount: 125, percentage: 27)
                    Divider()
                    CarExpenseRow(car: "У 177 АА 797", amount: 125, percentage: 27)
                    Divider()
                    CarExpenseRow(car: "Все", amount: 465, percentage: 100)
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
