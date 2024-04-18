//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 15.12.23.
//

import SwiftUI

struct IndicatorPoint: View {
    var settings: LineChartSettings
    var body: some View {
        ZStack{
            Circle()
                .fill(settings.indicatorColor)
            Circle()
                .stroke(settings.indicatorStrokeColor, style: StrokeStyle(lineWidth: settings.indicatorStrokeWidth))
        }
        .frame(width: settings.indicatorWidth, height: settings.indicatorWidth)
        .shadow(color: Colors.LegendColor, radius: 6, x: 0, y: 0)
    }
}

struct IndicatorPoint_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorPoint(settings: LineChartSettings(title: "Discofox Analytics", gradientColor: LinearGradient(colors: [Color(hexString: "0097F7"), Color(hexString: "D200D4")], startPoint: .bottom, endPoint: .top)))
    }
}
