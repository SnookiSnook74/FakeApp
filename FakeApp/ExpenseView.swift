//
//  ExpenciveView.swift
//  FakeApp
//
//  Created by DonHalab on 01.06.2024.
//

import SwiftUI

struct ExpenseView: View {
    @Binding var amount: String
    @Binding var description: String
    @State private var showEditSheet = false
    @State private var editField = ""
    @State private var fieldToEdit: FieldToEdit?

    enum FieldToEdit {
        case amount, description
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(amount)
                .font(.title)
                .fontWeight(.bold)
                .frame(width: 170, alignment: .leading)
                .onTapGesture {
                    fieldToEdit = .amount
                    editField = amount
                    showEditSheet = true
                }
            Text(description)
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .onTapGesture {
                    fieldToEdit = .description
                    editField = description
                    showEditSheet = true
                }
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: 80, alignment: .leading)
        .background(Color.white)
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
                        case .amount:
                            amount = editField
                        case .description:
                            description = editField
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

#Preview {
    ContentView()
}
