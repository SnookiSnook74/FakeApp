//
//  LoadScreen.swift
//  FakeApp
//
//  Created by DonHalab on 01.06.2024.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "car.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            Text("FakeParking")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text("by Anatoly Khalabov")
            Spacer()
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SplashScreenView()
}
