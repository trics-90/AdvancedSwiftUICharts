//
//  File.swift
//  
//
//  Created by Кирилл Зверев on 15.12.23.
//

import Foundation
import SwiftUI

public struct LineChartSettings {
    public let title: String
    public let subTitle: String?
    public let lineWidth: CGFloat
    public let showLineBlur: Bool
    public let showIndicators: Bool
    public let lineBackgroundBlurRadius: CGFloat
    public let backgroundBlurLineWidth: CGFloat
    public let showLineShadow: Bool
    public let gradientColor: LinearGradient// = LinearGradient(colors: [Color(hexString: "0097F7"), Color(hexString: "D200D4")], startPoint: .bottom, endPoint: .top)
    public let curvedLines: Bool
    public let showLineBackground: Bool
    public let backgroundColor: Color
    public let chartCornerRadius: CGFloat
    public let lineShadowRadius: CGFloat
    public let indicatorColor: Color
    public let indicatorStrokeColor: Color
    public let indicatorStrokeWidth: CGFloat
    public let indicatorWidth: CGFloat
    public let showHorizontalGrid: Bool
    public let numberOfHorizontalGridLines: Int
    public let isMaxValueOnTop: Bool
    public let linePoints: [Double]?
    
    public init(title: String,
                subTitle: String? = nil,
                lineWidth: CGFloat = 2,
                showLineBlur: Bool = true,
                showIndicators: Bool = false,
                lineBackgroundBlurRadius: CGFloat = 5,
                backgroundBlurLineWidth: CGFloat = 4,
                showLineShadow: Bool = false,
                gradientColor: LinearGradient,
                curvedLines: Bool = true,
                showLineBackground: Bool = true,
                backgroundColor: Color = .black,
                chartCornerRadius: CGFloat = 25,
                lineShadowRadius: CGFloat = 6,
                indicatorColor: Color = .purple,
                indicatorStrokeColor: Color = .white,
                indicatorStrokeWidth: CGFloat = 4,
                indicatorWidth: CGFloat = 14,
                showHorizontalGrid: Bool = true,
                numberOfHorizontalGridLines: Int = 4,
                isMaxValueOnTop: Bool = false,
                linePoints: [Double]? = nil) {
        self.title = title
        self.subTitle = subTitle
        self.lineWidth = lineWidth
        self.showLineBlur = showLineBlur
        self.showIndicators = showIndicators
        self.lineBackgroundBlurRadius = lineBackgroundBlurRadius
        self.backgroundBlurLineWidth = backgroundBlurLineWidth
        self.showLineShadow = showLineShadow
        self.gradientColor = gradientColor
        self.curvedLines = curvedLines
        self.showLineBackground = showLineBackground
        self.backgroundColor = backgroundColor
        self.chartCornerRadius = chartCornerRadius
        self.lineShadowRadius = lineShadowRadius
        self.indicatorColor = indicatorColor
        self.indicatorStrokeColor = indicatorStrokeColor
        self.indicatorStrokeWidth = indicatorStrokeWidth
        self.indicatorWidth = indicatorWidth
        self.showHorizontalGrid = showHorizontalGrid
        self.numberOfHorizontalGridLines = numberOfHorizontalGridLines
        self.isMaxValueOnTop = isMaxValueOnTop
        self.linePoints = linePoints
    }
}
