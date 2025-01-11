//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 13.12.23.
//

import SwiftUI

public struct BarChartView: View {
    
    // Chart Style
    public let data: [BarData]
    public var settings: BarChartSettings
    @State var showIndicator: Bool = false
    @State var currentValue: BarData = BarData(value: 8, title: "Jan")
    
    public init(settings: BarChartSettings, data: [BarData]) {
        self.settings = settings
        self.data = data
    }
    
        
    public var body: some View {
        VStack {
            ChartTitle(showIndicator: $showIndicator, currentValue: $currentValue, titleSettings: settings.titleSettings)
            GeometryReader { proxy in
                let width = proxy.size.width
                BarChartRow(data: data, barSettings: settings.barSettings, width: width, showIndicator: $showIndicator, currentValue: $currentValue)
            }
        }
        .padding()
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(settings: BarChartSettings(titleSettings: BarChartTitleSettings(title: "Bar Chart")), data: [
            BarData(value: 7, title: "Jan"),
            BarData(value: 9, title: "Feb"),
            BarData(value: 4, title: "Mar"),
            BarData(value: 5, title: "Apr"),
            BarData(value: 4, title: "May"),
            BarData(value: 9, title: "Jun"),
            BarData(value: 6, title: "Jul"),
            BarData(value: 8, title: "Aug"),
            BarData(value: 9, title: "Sep"),
            BarData(value: 6, title: "Oct"),
            BarData(value: 10, title: "Nov"),
            BarData(value: 6, title: "Dec")
        ])
            .frame(height: 200)
            .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.161))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .padding(.horizontal)
    }
}

fileprivate struct ChartTitle: View {
    @Binding var showIndicator: Bool
    @Binding var currentValue: BarData
    let titleSettings: BarChartTitleSettings
    var body: some View {
        HStack {
            if showIndicator {
                HStack {
                    Text(String(self.currentValue.value))
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("| " + self.currentValue.title)
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                .foregroundColor(titleSettings.titleColor)
            } else {
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
            }
            Spacer()
        }
    }
}


