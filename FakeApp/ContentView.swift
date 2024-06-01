//
//  ContentView.swift
//  FakeApp
//
//  Created by DonHalab on 01.06.2024.
//

import SwiftUI

struct ExpenseView: View {
    @Binding var amount: String
    @Binding var description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            TextField("Введите сумму", text: $amount)
                .font(.title)
                .fontWeight(.bold)
                .keyboardType(.numberPad)
            TextField("Введите описание", text: $description)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(20)
        .frame(maxWidth: .infinity,maxHeight: 80, alignment: .leading)
        .background(Color.white)
    }
}

struct ContentView: View {
    @State private var amount: String = "465 ₽"
    @State private var description: String = "Общая сумма расходов за 31.05"
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                GraphView()
                ExpenseView(amount: $amount, description: $description)
                    .background(Color(.systemGray6))
            }
        }
        .background(Color(.systemGray6))
    }
}

#Preview {
    ContentView()
}
