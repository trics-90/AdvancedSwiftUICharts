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
    public var settings: LineChartSettings = LineChartSettings(titleSettings: LineChartTitleSettings(title: "Title"))
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
                        Text(settings.titleSettings.title)
                            .font(.title2)
                            .fontWeight(.bold)
                        Text(settings.titleSettings.subTitle ?? "")
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
                Line(data: data, size: size, touchLocation: $touchLocation, showIndicatorDot: $showIndicatorDot, currentValue: $currentValue, showIndicators: $showIndicators, blurSettings: settings.lineBlurSettings, lineSettings: settings.lineSettings, backgroundSettings: settings.backgroundSettings, indicatorSettings: settings.indicatorSettings)
            }
        }
        .padding()
//        .background(settings.backgroundColor)
//        .cornerRadius(settings.chartCornerRadius)
    }
}

struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        LineChart(data: [LineData(date: "27 jul", value: 0), LineData(date: "28 jul", value: 2), LineData(date: "29 jul", value: 1.5), LineData(date: "30 jul", value: 7), LineData(date: "31 jul", value: 4), LineData(date: "1 aug", value: 0)], settings: LineChartSettings(titleSettings: LineChartTitleSettings(title: "Title")))
//            .background(.gray)
            .padding(.horizontal)
            .frame(height: 200)
    }
}

public struct LineData: Hashable, Decodable {
    public let date: String
    public let value: Double
    
    public init(date: String, value: Double) {
        self.date = date
        self.value = value
    }
}

