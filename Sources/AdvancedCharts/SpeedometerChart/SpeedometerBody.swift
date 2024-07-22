//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 10.07.2024.
//

import SwiftUI

struct SpeedometerBody: View {
    let settings: SpeedChartSettings
    let width: CGFloat
    let height: CGFloat
    let value: Double
    let targets: [Double]
    
    var center: CGPoint {
        let x: Double = (self.width / 2)
        let y: Double = self.height
        return CGPoint(x: x, y: y)
    }
    
    var maxTarget: Double {
        guard let maxTarget = self.targets.max() else {
            return 0.0
        }
        return maxTarget
    }
    
    var minTarget: Double {
        guard let minTarget = self.targets.min() else {
            return 0.0
        }
        return minTarget
    }
    
    var progress: Double {
        if value > maxTarget {
            return 1.0
        } else if value < minTarget {
            return 0.0
        } else {
            let pointsForValue = self.value / self.maxTarget
            let progress = 180 * pointsForValue
            return progress
        }
    }
    
    var body: some View {
        ZStack {
            OuterCircle(outerCircleDettings: settings.outerCircleSettings, height: height, width: width)
            InnerCircle(innerCircleSettings: settings.innerCircleSettings, height: height, width: width)
            CenterCircle(indicatorSettings: settings.speedIndicatorSettings, width: width, height: height)
            ForEach(targets, id: \.self) { target in
                Target(value: target)
                    .position(getTargetPosition(target: target))
                    .foregroundStyle(getTargetColor(target: target))
                    .fontWeight(target == self.minTarget || target == self.maxTarget ? .bold : .regular)
            }
            IndicatorRectangle(indicatorSettings: settings.speedIndicatorSettings, width: width, height: height, progress: progress)
        }
        .frame(width: width, height: height)
    }
    
    private func getTargetPosition(target: Double) -> CGPoint {
        let degreesPerTarget = 180 / maxTarget
        let degreesForTarget = degreesPerTarget * target
        let radians: CGFloat = degreesForTarget * Double.pi / 180
        let center = center
        // Offsets
        var y: CGFloat = 95 * sin(radians)
        let x: CGFloat = 95 * cos(radians)
        
        if target == minTarget || target == maxTarget {
            y = y + 5
        }
        return CGPoint(x: center.x - x, y: center.y - y)
    }
    
    private func getTargetColor(target: Double) -> Color {
        if target == minTarget {
            return self.settings.targetsSettings.minTargetColor
        } else if target == maxTarget {
            return self.settings.targetsSettings.maxTargetColor
        } else {
            return self.settings.targetsSettings.mediumTargetColor
        }
    }
}

#Preview {
    SpeedometerBody(settings: SpeedChartSettings(speedTitleSettings: SpeedTitleSettings(title: "Speedometr Chart")), width: 380, height: 150, value: 0.43, targets: [0, 0.25, 0.5, 0.75, 1])
}

fileprivate struct OuterCircle: View {
    let outerCircleDettings: SpeedOuterCircleSettings
    let height: CGFloat
    let width: CGFloat
    
    var circleDiameter: CGFloat {
        return height * 2 - outerCircleDettings.lineWidth
    }
    
    
    let strokewidth: CGFloat = 20
    let gradient: AngularGradient = AngularGradient(colors: [.blue, .red, .red], center: .center, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 90))
    var body: some View {
        Group {
            Circle()
                .trim(from: 0.5, to: 1)
                .stroke(outerCircleDettings.gradient, lineWidth: outerCircleDettings.lineWidth)
                .frame(height: circleDiameter)
                .offset(x: 0, y: height / 2)
        }
        .frame(height: height)
        .frame(maxWidth: .infinity)
    }
}

fileprivate struct InnerCircle: View {
    let innerCircleSettings: SpeedInnerCircleSettings
    let height: CGFloat
    let width: CGFloat
    
    var circleDiameter: CGFloat {
        return height - innerCircleSettings.lineWidth
    }
    
    let strokewidth: CGFloat = 3
    let gradient: AngularGradient = AngularGradient(colors: [.blue, .red, .red], center: .center, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 90))
    var body: some View {
        Group {
            Circle()
                .trim(from: 0.5, to: 1)
                .stroke(innerCircleSettings.gradient, lineWidth: innerCircleSettings.lineWidth)
                .frame(height: circleDiameter)
                .offset(x: 0, y: height / 2)
        }
        .frame(height: height)
        .frame(maxWidth: .infinity)
    }
}


fileprivate struct CenterCircle: View {
    let indicatorSettings: SpeedIndicatorSettings
    let width: CGFloat
    let height: CGFloat
    var body: some View {
        Group {
            Circle()
                .trim(from: 0.5, to: 1)
                .fill(indicatorSettings.circleColor)
                .frame(height: indicatorSettings.circleRadius * 2)
                .offset(x: 0, y: height / 2)
        }
        .frame(height: height)
    }
}

fileprivate struct IndicatorRectangle: View {
    let indicatorSettings: SpeedIndicatorSettings
    let width: CGFloat
    let height: CGFloat
    let progress: Double
    var indicatorLenght: CGFloat {
        return height - 10
    }
    var body: some View {
        Group {
            RoundedRectangle(cornerRadius: 5)
                .fill(indicatorSettings.stickColor)
                .shadow(radius: indicatorSettings.stickShadowRadius)
                .frame(width: indicatorLenght, height: indicatorSettings.stickWidth, alignment: .center)
                .offset(x: indicatorLenght / 2, y: height / 2 - 2.5)
        }
        .frame(width: width, height: height)
        .rotationEffect(Angle(degrees: -180 + progress), anchor: UnitPoint(x: 0.5, y: 0.988))
    }
}

fileprivate struct Target: View {
    let value: Double
    var body: some View {
        Text("\(Int(value * 100))%")
            .font(.caption.bold())
    }
}
