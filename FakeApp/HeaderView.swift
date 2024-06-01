//
//  HeaderView.swift
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
            .frame(width: 400, height: 40)
            
            Divider()
            Spacer()
            Spacer()
            HStack(spacing: 29){
                ForEach(["Неделя", "Мес", "3 мес", "6 мес", "Год"], id: \.self) { period in
                    Button(action: {
                        selectedPeriod = period
                    }) {
                        Text(period)
                            .font(.system(size: 10))
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
