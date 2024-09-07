//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 15.12.23.
//

import SwiftUI

struct IndicatorPoint: View {
    var settings: IndicatorSettings
    var body: some View {
        ZStack{
            Circle()
                .fill(settings.color)
            Circle()
                .stroke(settings.strokeColor, style: StrokeStyle(lineWidth: settings.strokeWidth))
        }
        .frame(width: settings.size, height: settings.size)
        .shadow(color: Colors.LegendColor, radius: 6, x: 0, y: 0)
    }
}

struct IndicatorPoint_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorPoint(settings: IndicatorSettings())
    }
}
