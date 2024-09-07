//
//  File.swift
//  
//
//  Created by Кирилл Зверев on 15.12.23.
//

import Foundation
import SwiftUI

public struct LineChartSettings {
    public let titleSettings: LineChartTitleSettings // Title & Subtitle of Graph
    public let lineBlurSettings: LineBlurSettings // Blur settings behind the main line
    public let lineSettings: LineSettings // Main line settings
    public let indicatorSettings: IndicatorSettings // Indicator Style
    public let backgroundSettings: LineChartBackgroundSettings
    public let curvedLines: Bool
//    public let showHorizontalGrid: Bool
//    public let numberOfHorizontalGridLines: Int
//    public let isMaxValueOnTop: Bool
//    public let linePoints: [Double]?
    
    public init(titleSettings: LineChartTitleSettings, lineBlurSettings: LineBlurSettings = LineBlurSettings(), lineSettings: LineSettings = LineSettings(), indicatorSettings: IndicatorSettings = IndicatorSettings(), backgroundSettings: LineChartBackgroundSettings = LineChartBackgroundSettings(), curvedLines: Bool = true) {
        self.titleSettings = titleSettings
        self.lineBlurSettings = lineBlurSettings
        self.lineSettings = lineSettings
        self.indicatorSettings = indicatorSettings
        self.backgroundSettings = backgroundSettings
        self.curvedLines = curvedLines
    }
}

public struct LineChartTitleSettings {
    public let title: String
    public let subTitle: String!
    public let titleColor: Color!
    public let subTitleColor: Color!
    
    public init(title: String, subTitle: String! = nil, titleColor: Color! = nil, subTitleColor: Color! = nil) {
        self.title = title
        self.subTitle = subTitle
        self.titleColor = titleColor
        self.subTitleColor = subTitleColor
    }
}

public struct LineBlurSettings {
    public let showLineBlur: Bool
    public let lineWidth: CGFloat
    public let blurRadius: CGFloat
    public let lineColor: LinearGradient
    
    public init(showLineBlur: Bool = true, lineWidth: CGFloat = 2, blurRadius: CGFloat = 5, lineColor: LinearGradient = LinearGradient(colors: [.blue, .red], startPoint: .bottom, endPoint: .top)) {
        self.showLineBlur = showLineBlur
        self.lineWidth = lineWidth
        self.blurRadius = blurRadius
        self.lineColor = lineColor
    }
}

public struct LineSettings {
    public let lineWidth: CGFloat
    public let colors: LinearGradient
    public let shadowRadius: CGFloat
    public let isCurved: Bool
    public let isMaxOnTop: Bool
    
    public init(lineWidth: CGFloat = 4, colors: LinearGradient = LinearGradient(colors: [.blue, .red], startPoint: .bottom, endPoint: .top), shadowRadius: CGFloat = 2, isCurved: Bool = true, isMaxOnTop: Bool = true) {
        self.lineWidth = lineWidth
        self.colors = colors
        self.shadowRadius = shadowRadius
        self.isCurved = isCurved
        self.isMaxOnTop = isMaxOnTop
    }
}

public struct IndicatorSettings {
    public let color: Color
    public let strokeColor: Color
    public let strokeWidth: CGFloat
    public let size: CGFloat
    
    public init(color: Color = .white, strokeColor: Color = .black, strokeWidth: CGFloat = 2, size: CGFloat = 14) {
        self.color = color
        self.strokeColor = strokeColor
        self.strokeWidth = strokeWidth
        self.size = size
    }
}

public struct LineChartBackgroundSettings {
    public let showBackground: Bool
    public let colors: LinearGradient
    
    public init(showBackground: Bool = true, colors: LinearGradient = LinearGradient(colors: [.blue.opacity(0.2), .red.opacity(0.2)], startPoint: .bottom, endPoint: .top)) {
        self.showBackground = showBackground
        self.colors = colors
    }
}
