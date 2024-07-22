//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 12.07.2024.
//

import SwiftUI

public struct RatingLineChart: View {
    public let settings: RatingChartSettings
    public let data: [RatingData]
    
    @State var showIndicatorDot: Bool = false
    @State var currentValue: RatingData = RatingData(value: 6, description: "")
    
    public init(settings: RatingChartSettings, data: [RatingData], showIndicatorDot: Bool, currentValue: RatingData) {
        self.settings = settings
        self.data = data
        self.showIndicatorDot = showIndicatorDot
        self.currentValue = currentValue
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
                Text(String(currentValue.value))
                    .font(.title2)
                    .fontWeight(.bold)
            }
            GeometryReader { proxy in
                let size = proxy.size
                RatingChartRow(settings: settings, size: size, data: data)
            }
//            .background(settings.chartBackground)
//            .clipShape(RoundedRectangle(cornerRadius: settings.chartCornerRadius))
        }
        .padding()
    }
}

#Preview {
    RatingLineChart(settings: RatingChartSettings(title: "Rating Chart"), data: [
        RatingData(value: 30, description: "Jul 23"),
        RatingData(value: 28, description: "Aug 23"),
        RatingData(value: 23, description: "Sep 23"),
        RatingData(value: 25, description: "Oct 23"),
        RatingData(value: 20, description: "Nov 23"),
        RatingData(value: 20, description: "Dec 23"),
        RatingData(value: 23, description: "Jan 24"),
        RatingData(value: 18, description: "Feb 24"),
        RatingData(value: 15, description: "Mar 24"),
        RatingData(value: 10, description: "Apr 24"),
        RatingData(value: 11, description: "May 24"),
        RatingData(value: 11, description: "Jun 24"),
    ], showIndicatorDot: false, currentValue: RatingData(value: 6, description: ""))
        .background(.gray)
        .frame(height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding()

}

public struct RatingData: Hashable {
    public let value: Int
    public let description: String
    public init(value: Int, description: String) {
        self.value = value
        self.description = description
    }
}

/*
 (settings: RatingChartSettings(title: "Rating Chart", subTitle: nil, gridColor: .white, verticalLegendWidth: 20, horizontalLegendHeight: 30, chartBackground: .black, chartCornerRadius: 20), data: [
     RatingData(value: 30, description: "Jul 23"),
     RatingData(value: 28, description: "Aug 23"),
     RatingData(value: 23, description: "Sep 23"),
     RatingData(value: 25, description: "Oct 23"),
     RatingData(value: 20, description: "Nov 23"),
     RatingData(value: 20, description: "Dec 23"),
     RatingData(value: 23, description: "Jan 24"),
     RatingData(value: 18, description: "Feb 24"),
     RatingData(value: 15, description: "Mar 24"),
     RatingData(value: 10, description: "Apr 24"),
     RatingData(value: 11, description: "May 24"),
     RatingData(value: 11, description: "Jun 24"),
 ])
 */
