//
//  File.swift
//  
//
//  Created by Кирилл Зверев on 15.12.23.
//

import Foundation
import SwiftUI

public struct LineChartSettings {
    public var title: String = "Discofox Analytics"
    public var subTitle: String?
    public var lineWidth: CGFloat = 2
    public var showLineBlur: Bool = true
    public var showIndicators: Bool = false
    public var lineBackgroundBlurRadius: CGFloat = 5
    public var backgroundBlurLineWidth: CGFloat = 4
    public var showLineShadow: Bool = true
    public var gradientColor: LinearGradient = LinearGradient(colors: [Color(hexString: "0097F7"), Color(hexString: "D200D4")], startPoint: .bottom, endPoint: .top)
    public var curvedLines: Bool = true
    public var showLineBackground: Bool = true
    public var backgroundColor: Color = .black
    public var chartCornerRadius: CGFloat = 25
    public var lineShadowRadius: CGFloat = 6
    public var indicatorColor: Color = Color(hexString: "#FF57A6")
    public var indicatorStrokeColor: Color = .white
    public var indicatorStrokeWidth: CGFloat = 4
    public var indicatorWidth: CGFloat = 14
    public var showHorizontalGrid: Bool = true
    public var numberOfHorizontalGridLines: Int = 4
    public var isMaxValueOnTop: Bool = false
    public var linePoints: [Double]? = nil
    
    public init() {}
}
