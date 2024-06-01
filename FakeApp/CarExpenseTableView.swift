//
//  CarInfo.swift
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
                TextField("", text: $car)
                    .font(.headline)
                    .frame(width: 120)
                    .fixedSize(horizontal: true, vertical: false)
                if car != "Все" {
                    TextField("", text: $carDescript)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .frame(width: 90)
                        .fixedSize(horizontal: true, vertical: false)
                }
            }
            Spacer()
            HStack(spacing: 4) {
                TextField("Сумма", text: $amount)
                    .font(.system(size: 13))
                    .frame(width: 140)
                    .fixedSize(horizontal: true, vertical: false)
                    .multilineTextAlignment(.trailing)
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

struct CarExpenseHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("АВТОМОБИЛЬ")
                .font(.system(size: 13))
                .foregroundColor(.gray)
                .padding(.horizontal)
                .padding(.bottom, -8)
                .frame(height: 45, alignment: .leading)
            Divider()
        }
    }
}

struct CarExpenseTableView: View {
    @Binding var carExpenses: [CarExpense]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            CarExpenseHeaderView()
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

#Preview {
    ContentView()
}
