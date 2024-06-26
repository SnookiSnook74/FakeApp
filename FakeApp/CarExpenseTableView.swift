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
    @State private var showEditSheet = false
    @State private var editField = ""
    @State private var fieldToEdit: FieldToEdit?
    
    enum FieldToEdit {
        case car, amount, carDescript
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(car)
                    .font(.headline)
                    .frame(width: 120, alignment: .leading)
                    .fixedSize(horizontal: true, vertical: false)
                    .onTapGesture {
                        fieldToEdit = .car
                        editField = car
                        showEditSheet = true
                    }
                if car != "Все" {
                    Text(carDescript)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .frame(width: 90, alignment: .leading)
                        .fixedSize(horizontal: true, vertical: false)
                        .onTapGesture {
                            fieldToEdit = .carDescript
                            editField = carDescript
                            showEditSheet = true
                        }
                }
            }
            .padding(.leading, 6)
            Spacer()
            HStack(spacing: 4) {
                Text(amount)
                    .font(.system(size: 13))
                    .frame(width: 140, alignment: .trailing)
                    .fixedSize(horizontal: true, vertical: false)
                    .onTapGesture {
                        fieldToEdit = .amount
                        editField = amount
                        showEditSheet = true
                    }
                Button(action: {
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
        .sheet(isPresented: $showEditSheet) {
            VStack {
                Text("Редактировать")
                    .font(.headline)
                TextField("Введите новое значение", text: $editField)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack {
                    Button("Отмена") {
                        showEditSheet = false
                    }
                    .padding()
                    Spacer()
                    Button("Сохранить") {
                        switch fieldToEdit {
                        case .car:
                            car = editField
                        case .amount:
                            amount = editField
                        case .carDescript:
                            carDescript = editField
                        case .none:
                            break
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
        let newExpense = CarExpense(car: "Новый автомобиль", amount: "0 ₽ (0%)", carDescript: "описание")
        carExpenses.append(newExpense)
    }
}


#Preview {
    ContentView()
}
