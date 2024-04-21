//
//  File.swift
//  
//
//  Created by Кирилл Зверев on 14.07.2024.
//

import Foundation
import SwiftUI

public struct RatingChartSettings {
    public let title: String
    public let subTitle: String?
    public let gridColor: Color
    public let verticalLegendWidth: CGFloat
    public let horizontalLegendHeight: CGFloat
    public let chartBackground: Color?
    public let chartCornerRadius: CGFloat
    
    public init(title: String, subTitle: String?, gridColor: Color, verticalLegendWidth: CGFloat, horizontalLegendHeight: CGFloat, chartBackground: Color?, chartCornerRadius: CGFloat) {
        self.title = title
        self.subTitle = subTitle
        self.gridColor = gridColor
        self.verticalLegendWidth = verticalLegendWidth
        self.horizontalLegendHeight = horizontalLegendHeight
        self.chartBackground = chartBackground
        self.chartCornerRadius = chartCornerRadius
    }
}
