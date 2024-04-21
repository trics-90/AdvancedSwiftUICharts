//
//  File.swift
//  
//
//  Created by Кирилл Зверев on 21.04.2024.
//

import Foundation
import SwiftUI

public struct BarChartSettings {
    public let title: String
    public let titleColor: Color!
    public let subTitle: String!
    public let subTitleColor: Color
    public let backgroundColor: Color
    public let cornerRadius: CGFloat
    public let barWidthMultiplier: CGFloat
    public let maxBarColor: Color
    public let minBarColor: Color
    public let mediumBarColor: Color
    public let maxBarBlur: CGFloat
    public let minBarBlur: CGFloat
    public let mediumBarBlur: CGFloat
    public let cornerRadiusMultiplier: Double
    
    public init(title: String, titleColor: Color? = nil, subTitle: String? = nil, subTitleColor: Color = .gray, backgroundColor: Color = .black, cornerRadius: CGFloat = 25, barWidthMultiplier: CGFloat = 0.2, maxBarColor: Color = .red, minBarColor: Color = .blue, mediumBarColor: Color = .gray, maxBarBlur: CGFloat = 5, minBarBlur: CGFloat = 5, mediumBarBlur: CGFloat = 5, cornerRadiusMultiplier: Double = 0.5) {
        self.title = title
        self.titleColor = titleColor
        self.subTitle = subTitle
        self.backgroundColor = backgroundColor
        self.subTitleColor = subTitleColor
        self.cornerRadius = cornerRadius
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
