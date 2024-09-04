//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 14.12.23.
//

import SwiftUI

public struct LineChart: View {
    // Values
    public let data: [LineData]
    
    // Dimensions
    public var radius: CGFloat = 25
    public let frame: CGSize = .zero
    
    @State private var touchLocation: CGPoint = .zero
    @State private var showIndicatorDot: Bool = false
    @State private var showIndicators: Bool = false
    // Settings
    public var settings: LineChartSettings = LineChartSettings(title: "Discofox Analytics", gradientColor: LinearGradient(colors: [Color(hexString: "0097F7"), Color(hexString: "D200D4")], startPoint: .bottom, endPoint: .top))
    @State var currentValue: LineData = LineData(date: "", value: 2) {
        didSet{
            if (oldValue != self.currentValue && showIndicatorDot) {
                HapticFeedback.playSelection()
            }
            
        }
    }
    
    public init(data: [LineData], settings: LineChartSettings) {
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
                HStack {
                    Text(currentValue.date)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("| " + String(currentValue.value))
                        .font(.title2)
                        .foregroundStyle(.gray)
                    Spacer()
                }
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
//    let data: [Double] = [5, 10, 8, 9, 3, 15, 14, 18, 14, 12, 7, 2, 1]
//    let data: [Double] = [
//        LineData(value: 5, description: "Jan'24"),
//        LineData(value: 10, description: "Feb'24"),
//        LineData(value: 8, description: "Mar'24"),
//        LineData(value: 9, description: "Apr'24"),
//        LineData(value: 3, description: "May'24"),
//        LineData(value: 15, description: "Jun'24"),
//        LineData(value: 14, description: "Jul'24"),
//        LineData(value: 18, description: "Aug'24"),
//        LineData(value: 14, description: "Sep'24"),
//        LineData(value: 12, description: "Oct'24"),
//        LineData(value: 7, description: "Nov'24"),
//        LineData(value: 2, description: "Dec'24"),
//        LineData(value: 1, description: "Jan'25"),
//    ]
    static var previews: some View {
        LineChart(data: [LineData(date: "27 jul", value: 0), LineData(date: "28 jul", value: 2), LineData(date: "29 jul", value: 1.5), LineData(date: "30 jul", value: 7), LineData(date: "31 jul", value: 4), LineData(date: "1 aug", value: 0)], settings: LineChartSettings(title: "Discofox Analytics", gradientColor: LinearGradient(colors: [Color(hexString: "0097F7"), Color(hexString: "D200D4")], startPoint: .bottom, endPoint: .top)))
            .padding(.horizontal)
            .frame(height: 200)
    }
}

public struct LineData: Hashable {
    let date: String
    let value: Double
}

