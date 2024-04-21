//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 12.12.23.
//

import SwiftUI

public struct ProgressChart: View {
    public let settings: ProgressChartSettings
    let data: Double
    let targets: [Double]!
    public var body: some View {
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
            Spacer()
            ProgressChartRow(data: data, targets: targets)
        }
        .padding()
        .background(.gray.opacity(0.2))
        .cornerRadius(settings.chartCornerRadius)
        .shadow(radius: 10)
        .padding()
    }
}

struct ProgressChart_Previews: PreviewProvider {
    static var previews: some View {
        ProgressChart(settings: ProgressChartSettings(title: "Progress", gradientColor: LinearGradient(colors: [.red, .orange], startPoint: .leading, endPoint: .trailing)), data: 0.43, targets: [0.0, 0.25, 0.5, 0.75, 1.0])
            .frame(height: 160)
    }
}
