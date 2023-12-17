//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 16.12.23.
//

import SwiftUI

struct CircleLineChart: View {
    let currentValue: Double
    let maxValue: Double
    let centerText: String
    var progress: Int {
        return Int(currentValue * 100 / maxValue)
    }
    let settings: CircleLineChartSettings
    var body: some View {
        VStack {
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
            GeometryReader { proxy in
                let size = proxy.size
                HStack {
                    Spacer()
                    ZStack {
                        CircleLine(current: currentValue, maximum: maxValue, size: size)
                        VStack {
                            Text(centerText)
                                .font(.title)
                                .fontWeight(.heavy)
                            Text(String(progress) + "%")
                                .font(.callout)
                        }
                    }
                    Spacer()
                }
            }
        }
        .padding()
        .background(.black)
        .cornerRadius(settings.chartCornerRadius)
        .frame(width: 200, height: 200)
        .shadow(radius: 10)
        .padding()
    }
}

struct CircleLineChart_Previews: PreviewProvider {
    static var previews: some View {
        CircleLineChart(currentValue: 210, maxValue: 210, centerText: "Мain", settings: CircleLineChartSettings())
    }
}
