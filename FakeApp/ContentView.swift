//
//  ContentView.swift
//  FakeApp
//
//  Created by DonHalab on 01.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var amount: String = "465 ₽"
    @State private var description: String = "Общая сумма расходов за 31.05"
    
    @State private var carExpenses = [
        CarExpense(car: "С 329 АХ 40", amount: "215 ₽ (46%)", carDescript: "(стария)"),
        CarExpense(car: "С 480 АС 40", amount: "125 ₽ (27%)", carDescript: "(прадо)"),
        CarExpense(car: "У 177 АА 797", amount: "125 ₽ (27%)", carDescript: "(порше 718)"),
        CarExpense(car: "Все", amount: "14 465 ₽ (100%)", carDescript: "")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                HeaderView()
                GraphView()
                ExpenseView(amount: $amount, description: $description)
                    .background(Color(.systemGray6))
                CarExpenseTableView(carExpenses: $carExpenses)
            }
        }
        .background(Color(.systemGray6))
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    ContentView()
}
