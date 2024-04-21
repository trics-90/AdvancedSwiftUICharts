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
//        self.data = data
        self.settings = settings
        self.data = data
    }
    
        
    public var body: some View {
        VStack {
            HStack {
                if showIndicator {
                    HStack {
                        Text(String(self.currentValue.value))
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(settings.titleColor)
                        Text("| " + self.currentValue.title)
                            .font(.title2)
                            .foregroundColor(.gray)
                            .foregroundColor(settings.titleColor)
                    }
                } else {
                    VStack(alignment: .leading) {
                        Text(settings.title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(settings.titleColor)
                        if settings.subTitle != nil {
                            Text(settings.subTitle)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(settings.subTitleColor)
                        }
                    }
                }
                Spacer()
                    
            }
            GeometryReader { proxy in
                let width = proxy.size.width
                BarChartRow(data: data, settings: settings, width: width, showIndicator: $showIndicator, currentValue: $currentValue)
            }
        }
        .padding()
        .background(settings.backgroundColor)
        .cornerRadius(settings.cornerRadius)
//        .contentShape(RoundedRectangle(cornerRadius: settings.cornerRadius))
//        .padding()
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(settings: BarChartSettings(title: "Активность"), data: [
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
            .padding(.horizontal)
    }
}
