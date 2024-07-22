//
//  File.swift
//  
//
//  Created by Кирилл Зверев on 22.07.2024.
//

import Foundation
import SwiftUI

public struct SpeedChartSettings {
    public let speedTitleSettings: SpeedTitleSettings
    public let outerCircleSettings: SpeedOuterCircleSettings
    public let innerCircleSettings: SpeedInnerCircleSettings
    public let speedIndicatorSettings: SpeedIndicatorSettings
    public let targetsSettings: TargetsSettings
    
    public init(speedTitleSettings: SpeedTitleSettings, outerCircleSettings: SpeedOuterCircleSettings = SpeedOuterCircleSettings(), innerCircleSettings: SpeedInnerCircleSettings = SpeedInnerCircleSettings(), speedIndicatorSettings: SpeedIndicatorSettings = SpeedIndicatorSettings(), targetsSettings: TargetsSettings = TargetsSettings()) {
        self.speedTitleSettings = speedTitleSettings
        self.outerCircleSettings = outerCircleSettings
        self.innerCircleSettings = innerCircleSettings
        self.speedIndicatorSettings = speedIndicatorSettings
        self.targetsSettings = targetsSettings
    }
}

public struct SpeedTitleSettings {
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

public struct SpeedOuterCircleSettings {
    public let lineWidth: CGFloat
    public let gradient: AngularGradient
    
    public init(lineWidth: CGFloat = 30, gradienMinColor: Color = .blue, gradientMaxColor: Color = .red) {
        self.lineWidth = lineWidth
        self.gradient = AngularGradient(colors: [gradienMinColor, gradientMaxColor, gradientMaxColor], center: .center, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 90))
    }
}

public struct SpeedInnerCircleSettings {
    public let lineWidth: CGFloat
    public let gradient: AngularGradient
    
    public init(lineWidth: CGFloat = 3, gradienMinColor: Color = .blue, gradientMaxColor: Color = .red) {
        self.lineWidth = lineWidth
        self.gradient = AngularGradient(colors: [gradienMinColor, gradientMaxColor, gradientMaxColor], center: .center, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 90))
    }
}

public struct SpeedIndicatorSettings {
    public let circleRadius: CGFloat
    public let circleColor: Color
    public let stickWidth: CGFloat
    public let stickColor: Color
    public let stickCornerRadius: CGFloat
    public let stickShadowRadius: CGFloat
    
    public init(circleRadius: CGFloat = 20, circleColor: Color = .white, stickWidth: CGFloat = 5, stickColor: Color = .white, stickCornerRadius: CGFloat = 2, stickShadowRadius: CGFloat = 5) {
        self.circleRadius = circleRadius
        self.circleColor = circleColor
        self.stickWidth = stickWidth
        self.stickColor = stickColor
        self.stickCornerRadius = stickCornerRadius
        self.stickShadowRadius = stickShadowRadius
    }
}

public struct TargetsSettings {
    public let minTargetColor: Color
    public let maxTargetColor: Color
    public let mediumTargetColor: Color
    
    public init(minTargetColor: Color = .blue, maxTargetColor: Color = .red, mediumTargetColor: Color = .gray) {
        self.minTargetColor = minTargetColor
        self.maxTargetColor = maxTargetColor
        self.mediumTargetColor = mediumTargetColor
    }
}
