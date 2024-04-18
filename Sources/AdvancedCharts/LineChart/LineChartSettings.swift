//
//  File.swift
//  
//
//  Created by Кирилл Зверев on 15.12.23.
//

import Foundation
import SwiftUI

public struct LineChartSettings {
    var title: String = "Discofox Analytics"
    var subTitle: String?
    var lineWidth: CGFloat = 2
    var showLineBlur: Bool = true
    var showIndicators: Bool = false
    var lineBackgroundBlurRadius: CGFloat = 5
    var backgroundBlurLineWidth: CGFloat = 4
    var showLineShadow: Bool = true
    var gradientColor: LinearGradient = LinearGradient(colors: [Color(hexString: "0097F7"), Color(hexString: "D200D4")], startPoint: .bottom, endPoint: .top)
    var curvedLines: Bool = true
    var showLineBackground: Bool = true
    var backgroundColor: Color = .black
    var chartCornerRadius: CGFloat = 25
    var lineShadowRadius: CGFloat = 6
    var indicatorColor: Color = Color(hexString: "#FF57A6")
    var indicatorStrokeColor: Color = .white
    var indicatorStrokeWidth: CGFloat = 4
    var indicatorWidth: CGFloat = 14
    var showHorizontalGrid: Bool = true
    var numberOfHorizontalGridLines: Int = 4
    var isMaxValueOnTop: Bool = false
    var linePoints: [Double]? = nil
}
