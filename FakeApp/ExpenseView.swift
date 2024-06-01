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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            TextField("Введите сумму", text: $amount)
                .font(.title)
                .fontWeight(.bold)
                .keyboardType(.numberPad)
                .frame(width: 170)
            TextField("Введите описание", text: $description)
                .font(.system(size: 12))
                .foregroundColor(.gray)
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: 80, alignment: .leading)
        .background(Color.white)
    }
}

#Preview {
    ContentView()
}
