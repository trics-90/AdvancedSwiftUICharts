//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 10.07.2024.
//

import SwiftUI

public struct SpeedometerChart: View {
    public let value: Double
    public let targets: [Double]
    
    public init(value: Double, targets: [Double]) {
        self.value = value
        self.targets = targets
    }
    
    public var body: some View {
        VStack {
            Text("Speedometer")
                .font(.title2)
                .fontWeight(.bold)
            GeometryReader { proxy in
                let height = proxy.size.height
                let width = proxy.size.width
                
                SpeedometerBody(width: width, height: height, value: value, targets: targets)
            }
            .frame(height: 150)
        }
        .padding(.horizontal)
        .padding(.top)
        .background(.gray.opacity(0.2))
//        .cornerRadius(30)
//        .shadow(radius: 10)
//        .padding()
    }
}

#Preview {
    SpeedometerChart(value: 0.57, targets: [0.0, 0.25, 0.5, 0.75, 1.0])
//        .frame(height: 317)
}

// w 350, h 231
// w 300, h 206
