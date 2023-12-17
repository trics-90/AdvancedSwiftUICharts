//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 16.12.23.
//

import SwiftUI

struct CircleLine: View {
    let current: CGFloat
    let maximum: CGFloat
    let size: CGSize
    var circleRadius: CGFloat {
        return size.height / 2
    }
    var S: CGFloat {
        return circleRadius * 2 * 3.14
    }
    
    var path: Path {
        Path { path in
            path.addArc(center: CGPoint(x: size.height / 2, y:  size.height / 2), radius: size.height / 2, startAngle: .degrees(0), endAngle: .degrees(360 * current / maximum), clockwise: false)
                
        }
    }
    
    let settings = CircleLineChartSettings()
    var body: some View {
        ZStack(alignment: .center) {
            path
                .stroke(AngularGradient(colors: current >= maximum ? [settings.completedColor] : settings.lineColors, center: .center, startAngle: .degrees(-settings.lineWidth / 2), endAngle: .degrees(360 * current / maximum)), style: StrokeStyle(lineWidth: settings.blurLineWidth, lineCap: .round, lineJoin: .round))
                .blur(radius: settings.blurRadius)
            path
                .stroke(AngularGradient(colors: current >= maximum ? [settings.completedColor] : settings.lineColors, center: .center, startAngle: .degrees(-settings.lineWidth / 2), endAngle: .degrees(360 * current / maximum)), style: StrokeStyle(lineWidth: settings.lineWidth, lineCap: .round, lineJoin: .round))
                .shadow(radius: 3)
        }
        .frame(width: size.height, height: size.height)
//        .background(.green)
        .rotationEffect(settings.chartRotation, anchor: .center)
        
    }
}

struct CircleLine_Previews: PreviewProvider {
    static var previews: some View {
        CircleLine(current: 200, maximum: 350, size: CGSize(width: 100, height: 100))
    }
}

struct CircleLineChartSettings {
    var lineWidth: CGFloat = 10
    var showBlur: Bool = true
    var blurRadius: CGFloat = 10
    var blurLineWidth: CGFloat = 10
    var lineColors: [Color] = [Color(hexString: "0097F7"), Color(hexString: "D200D4")]
    var chartRotation: Angle = .degrees(-90)
    var title: String = "Jack & Jill"
    var subTitle: String?
    var chartCornerRadius: CGFloat = 20
    var completedColor: Color = .yellow
}
