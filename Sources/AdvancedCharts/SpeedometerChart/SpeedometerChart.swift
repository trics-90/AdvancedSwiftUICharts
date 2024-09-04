//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 10.07.2024.
//

import SwiftUI

public struct SpeedometerChart: View {
    public let settings: SpeedChartSettings
    public let value: Double
    public let targets: [Double]
    
    public init(settings: SpeedChartSettings, value: Double, targets: [Double]) {
        self.settings = settings
        self.value = value
        self.targets = targets
    }
    
    public var body: some View {
        VStack {
            ChartTitle(titleSettings: settings.speedTitleSettings)
            GeometryReader { proxy in
                let height = proxy.size.height
                let width = proxy.size.width
                
                SpeedometerBody(settings: settings, width: width, height: height, value: value, targets: targets)
            }
            .frame(height: 150)
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

fileprivate struct ChartTitle: View {
    let titleSettings: SpeedTitleSettings
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(titleSettings.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(titleSettings.titleColor)
                if titleSettings.subTitle != nil {
                    Text(titleSettings.subTitle)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(titleSettings.subTitleColor)
                }
            }
            Spacer()
        }
        Spacer()
    }
}


#Preview {
    SpeedometerChart(settings: SpeedChartSettings(speedTitleSettings: SpeedTitleSettings(title: "Speedometer Chart")), value: 0.57, targets: [0.0, 0.25, 0.5, 0.75, 1.0])
        .frame(height: 250)
        .background(.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(.horizontal)
}
