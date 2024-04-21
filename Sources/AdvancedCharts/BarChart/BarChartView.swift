//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 13.12.23.
//

import SwiftUI

public struct BarChartView: View {
    
    // Chart Style
    public let data: [Double]
    public var settings: BarChartSettings
    @State var showIndicator: Bool = false
    @State var currentValue: Double = 0.0
    
        
    public var body: some View {
        VStack {
            HStack {
                if showIndicator {
                    HStack {
                        Text(String(self.currentValue))
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(settings.titleColor)
                        Text("| " + "Январь")
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
        .padding()
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(data: [2.0, 4.0, 8.0, 3.0, 1.5, 3.4, 8.0, 3.0, 1.5, 3.4, 1.5, 3.4], settings: BarChartSettings(title: "Активность"))
            .frame(height: 200)
            .shadow(radius: 10)
    }
}
