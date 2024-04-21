//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 10.07.2024.
//

import SwiftUI

struct SpeedometerBody: View {
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
            OuterCircle(height: height, width: width)
            InnerCircle(height: height, width: width)
            CenterCircle(width: width, height: height)
            ForEach(targets, id: \.self) { target in
                Target(value: target)
                    .position(getTargetPosition(target: target))
                    .foregroundStyle(getTargetColor(target: target))
                    .fontWeight(target == self.minTarget || target == self.maxTarget ? .bold : .regular)
            }
            IndicatorRectangle(width: width, height: height, progress: progress)
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
            return .blue
        } else if target == maxTarget {
            return .red
        } else {
            return .white
        }
    }
}

#Preview {
    SpeedometerBody(width: 380, height: 150, value: 0.43, targets: [0, 0.25, 0.5, 0.75, 1])
}

fileprivate struct OuterCircle: View {
    let height: CGFloat
    let width: CGFloat
    
    var circleDiameter: CGFloat {
        return height * 2 - strokewidth
    }
    
    
    let strokewidth: CGFloat = 20
    let gradient: AngularGradient = AngularGradient(colors: [.blue, .red, .red], center: .center, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 90))
    var body: some View {
        Group {
            Circle()
                .trim(from: 0.5, to: 1)
                .stroke(gradient, lineWidth: strokewidth)
                .frame(height: circleDiameter)
                .offset(x: 0, y: height / 2)
        }
        .frame(height: height)
        .frame(maxWidth: .infinity)
    }
}

fileprivate struct InnerCircle: View {
    let height: CGFloat
    let width: CGFloat
    
    var circleDiameter: CGFloat {
        return height - strokewidth
    }
    
    let strokewidth: CGFloat = 3
    let gradient: AngularGradient = AngularGradient(colors: [.blue, .red, .red], center: .center, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 90))
    var body: some View {
        Group {
            Circle()
                .trim(from: 0.5, to: 1)
                .stroke(gradient, lineWidth: strokewidth)
                .frame(height: circleDiameter)
                .offset(x: 0, y: height / 2)
        }
        .frame(height: height)
        .frame(maxWidth: .infinity)
    }
}


fileprivate struct CenterCircle: View {
    let width: CGFloat
    let height: CGFloat
    var body: some View {
        Group {
            Circle()
                .trim(from: 0.5, to: 1)
                .fill(.white)
                .frame(height: 20)
                .offset(x: 0, y: height / 2)
        }
        .frame(height: height)
    }
}

fileprivate struct IndicatorRectangle: View {
    let width: CGFloat
    let height: CGFloat
    let progress: Double
    var indicatorLenght: CGFloat {
        return height - 10
    }
    var body: some View {
        Group {
            RoundedRectangle(cornerRadius: 5)
                .fill(.white)
                .shadow(radius: 5)
                .frame(width: indicatorLenght, height: 5, alignment: .center)
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
