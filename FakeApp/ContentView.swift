//
//  ContentView.swift
//  FakeApp
//
//  Created by DonHalab on 01.06.2024.
//

import SwiftUI


struct HeaderView: View {
    @State private var selectedPeriod: String = "Неделя"
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                }
                Spacer()
                Text("Расходы на парковку")
                    .font(.headline)
                Spacer()
            }
            .padding()
            
            HStack {
                ForEach(["Неделя", "Мес", "3 мес", "6 мес", "Год"], id: \.self) { period in
                    Button(action: {
                        selectedPeriod = period
                    }) {
                        Text(period)
                            .font(.subheadline)
                            .foregroundColor(selectedPeriod == period ? .blue : .gray)
                            .padding(.horizontal)
                    }
                }
            }
            .padding(.bottom, 8)
            
            Divider()
        }
        .background(Color.white)
    }
}

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
                HeaderView()
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
