//
//  File.swift
//  
//
//  Created by Кирилл Зверев on 21.04.2024.
//

import Foundation
import SwiftUI

public struct BarChartSettings {
    public let titleSettings: BarChartTitleSettings
    public let barSettings: BarSettings
    
    public init(titleSettings: BarChartTitleSettings, barSettings: BarSettings = BarSettings()) {
        self.titleSettings = titleSettings
        self.barSettings = barSettings
    }
}

public struct BarChartTitleSettings {
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

public struct BarSettings {
    public let barWidthMultiplier: CGFloat
    public let maxBarColor: Color
    public let minBarColor: Color
    public let mediumBarColor: Color
    public let maxBarBlur: CGFloat
    public let minBarBlur: CGFloat
    public let mediumBarBlur: CGFloat
    public let cornerRadiusMultiplier: Double
    
    public init(barWidthMultiplier: CGFloat = 0.2, maxBarColor: Color = .red, minBarColor: Color = .blue, mediumBarColor: Color = .gray, maxBarBlur: CGFloat = 5, minBarBlur: CGFloat = 5, mediumBarBlur: CGFloat = 5, cornerRadiusMultiplier: Double = 0.5) {
        self.barWidthMultiplier = barWidthMultiplier
        self.maxBarColor = maxBarColor
        self.minBarColor = minBarColor
        self.mediumBarColor = mediumBarColor
        self.maxBarBlur = maxBarBlur
        self.minBarBlur = minBarBlur
        self.mediumBarBlur = mediumBarBlur
        self.cornerRadiusMultiplier = cornerRadiusMultiplier
    }
}
