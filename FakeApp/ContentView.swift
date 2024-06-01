//
//  ContentView.swift
//  FakeApp
//
//  Created by DonHalab on 01.06.2024.
//

import SwiftUI

struct DateView: View {
    let dates = [
        ("24.05", "ПТ"),
        ("25.05", "СБ"),
        ("26.05", "ВС"),
        ("27.05", "ПН"),
        ("28.05", "ВТ"),
        ("29.05", "СР"),
        ("30.05", "ЧТ"),
        ("31.05", "ПТ")
    ]
    
    var body: some View {
        LazyHStack(spacing: 20) {
            ForEach(dates, id: \.0) { date in
                VStack {
                    Text(date.0)
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                    Text(date.1)
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            DateView()
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
