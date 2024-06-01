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
    @Binding var carDescript: String
    var onDelete: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                TextField("Автомобиль", text: $car)
                    .font(.headline)
                    .frame(width: 120)
                TextField("", text: $carDescript)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(width: 90)
            }
            Spacer()
            HStack(spacing: 4) {
                TextField("Сумма", text: $amount)
                    .font(.system(size: 15))
                    .frame(width: 100)
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
        .onTapGesture(count: 2) {
            onDelete()
        }
    }
}

struct CarExpense: Identifiable {
    var id = UUID()
    var car: String
    var amount: String
    var carDescript: String
}

struct CarExpenseTableView: View {
    @Binding var carExpenses: [CarExpense]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("АВТОМОБИЛЬ")
                .font(.caption)
                .padding()
            Divider()
            ForEach($carExpenses) { $expense in
                CarExpenseRow(car: $expense.car, amount: $expense.amount, carDescript: $expense.carDescript, onDelete: {
                    if let index = carExpenses.firstIndex(where: { $0.id == expense.id }) {
                        carExpenses.remove(at: index)
                    }
                })
                Divider()
            }
        }
        .background(Color(.systemGray6))
        .onLongPressGesture {
            addNewCarExpense()
        }
    }
    
    func addNewCarExpense() {
        let newExpense = CarExpense(car: "Новый автомобиль", amount: "0 ₽ (0%)", carDescript: "")
        carExpenses.append(newExpense)
    }
}

struct ContentView: View {
    @State private var amount: String = "465 ₽"
    @State private var description: String = "Общая сумма расходов за 31.05"
    
    @State private var carExpenses = [
        CarExpense(car: "С 329 АХ 40", amount: "215 ₽ (46%)", carDescript: "(стария)"),
        CarExpense(car: "С 480 АС 40", amount: "125 ₽ (27%)", carDescript: "(прадо)"),
        CarExpense(car: "У 177 АА 797", amount: "125 ₽ (27%)", carDescript: "(порше 718)"),
        CarExpense(car: "Все", amount: "465 ₽ (100%)", carDescript: "")
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
    }
}

#Preview {
    ContentView()
}
