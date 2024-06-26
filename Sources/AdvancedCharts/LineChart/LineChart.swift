//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 14.12.23.
//

import SwiftUI

public struct LineChart: View {
    // Values
    public let data: [Double]
    
    // Dimensions
    public var radius: CGFloat = 25
    public let frame: CGSize = .zero
    
    @State private var touchLocation: CGPoint = .zero
    @State private var showIndicatorDot: Bool = false
    @State private var showIndicators: Bool = false
    // Settings
    public var settings: LineChartSettings = LineChartSettings(title: "Discofox Analytics", gradientColor: LinearGradient(colors: [Color(hexString: "0097F7"), Color(hexString: "D200D4")], startPoint: .bottom, endPoint: .top))
    @State var currentValue: Double = 2 {
        didSet{
            if (oldValue != self.currentValue && showIndicatorDot) {
                HapticFeedback.playSelection()
            }
            
        }
    }
    
    public init(data: [Double], settings: LineChartSettings) {
        self.data = data
        self.settings = settings
    }
    
    public var body: some View {
        VStack {
            if !showIndicatorDot {
                HStack {
                    VStack(alignment: .leading) {
                        Text(settings.title)
                            .font(.title2)
                            .fontWeight(.bold)
                        Text(settings.subTitle ?? "")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
            } else {
                Text(String(currentValue))
                    .font(.title2)
                    .fontWeight(.bold)
            }
            GeometryReader { proxy in
                let size = proxy.size
                Line(data: data, size: size, touchLocation: $touchLocation, showIndicatorDot: $showIndicatorDot, currentValue: $currentValue, showIndicators: $showIndicators, settings: settings)
            }
        }
        .padding()
        .background(settings.backgroundColor)
        .cornerRadius(settings.chartCornerRadius)
    }
}

struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        LineChart(data: [5, 10, 8, 9, 3, 15, 14, 18, 14, 12, 7, 2, 1], settings: LineChartSettings(title: "Discofox Analytics", gradientColor: LinearGradient(colors: [Color(hexString: "0097F7"), Color(hexString: "D200D4")], startPoint: .bottom, endPoint: .top)))
            .padding(.horizontal)
    }
}
