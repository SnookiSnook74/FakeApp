//
//  ContentView.swift
//  FakeApp
//
//  Created by DonHalab on 01.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var amount: String = "3 635 ₽"
    @State private var description: String = "Общая сумма расходов за 01.06"
    
    @State private var carExpenses = [
        CarExpense(car: "С 329 АХ 40", amount: "1 821 ₽ (50%)", carDescript: "(стария)"),
        CarExpense(car: "P 876 BA 799", amount: "1 814 ₽ (50%)", carDescript: "(майбах)"),
        CarExpense(car: "Все", amount: "3 635 ₽ (100%)", carDescript: "")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
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
