//
//  File.swift
//  
//
//  Created by Кирилл Зверев on 14.07.2024.
//

import Foundation
import SwiftUI

public struct RatingChartSettings {
    // Titles
    public let title: String
    public let subTitle: String!
    // Colors
    public let gridColor: Color
    public let chartBackground: Color?
    public let lineColor: Color
    public let verticalLegendColor: Color
    public let horizontalLegendColor: Color
    // Dimensions and corners
    public let verticalLegendWidth: CGFloat
    public let horizontalLegendHeight: CGFloat
    public let chartCornerRadius: CGFloat
    public let lineWidth: CGFloat
    public let gridLineWidth: CGFloat
    
    public init(title: String, subTitle: String! = nil, gridColor: Color = .white, chartBackground: Color? = nil, lineColor: Color = .white, verticalLegendColor: Color = .white, horizontalLegendColor: Color = .gray, verticalLegendWidth: CGFloat = 20, horizontalLegendHeight: CGFloat = 30, chartCornerRadius: CGFloat = 20, lineWidth: CGFloat = 0.5, gridLineWidth: CGFloat = 0.5) {
        self.title = title
        self.subTitle = subTitle
        self.gridColor = gridColor
        self.chartBackground = chartBackground
        self.lineColor = lineColor
        self.verticalLegendColor = verticalLegendColor
        self.horizontalLegendColor = horizontalLegendColor
        self.verticalLegendWidth = verticalLegendWidth
        self.horizontalLegendHeight = horizontalLegendHeight
        self.chartCornerRadius = chartCornerRadius
        self.lineWidth = lineWidth
        self.gridLineWidth = gridLineWidth
    }
}
