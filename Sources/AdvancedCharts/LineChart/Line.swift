//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 13.12.23.
//

import SwiftUI

struct Line: View {
    // Values
    var data: [LineData]
    let size: CGSize
    var maxPoint: LineData {
        guard let maxPoint = self.data.max(by: {$0.value < $1.value}) else {
            return LineData(date: "", value: 0)
        }
        return maxPoint
    }
    var minPoint: LineData {
        guard let minPoint = self.data.min(by: {$0.value < $1.value}) else {
            return LineData(date: "", value: 0)
        }
        return minPoint
    }
    
    // Dimensions
    var step: CGPoint {
        var y: CGFloat = 0
        var x: CGFloat = 0
        
        if data.count < 2 {
            x = 0
        } else {
            x = size.width / CGFloat(data.count - 1)
        }
        
        y = size.height / CGFloat(maxPoint.value - minPoint.value)
        return CGPoint(x: x, y: y)
    }
        
    // Visuals
    var path: Path {
        if lineSettings.isCurved {
            return Path.quadCurvedPathWithPoints(data: data.map({$0.value}), step: step, size: size, minPoint: minPoint.value, isMaxOnTop: lineSettings.isMaxOnTop)
        } else {
            return Path.linePathWithPoints(data: data.map({$0.value}), step: step, size: size, minPoint: minPoint.value, maxPoint: maxPoint.value, isMaxOnTop: lineSettings.isMaxOnTop)
        }
    }
    var backgroundPath: Path {
        if lineSettings.isCurved {
            return Path.quadCurvedPathWithPoints(data: data.map({$0.value}), step: step, size: size, minPoint: minPoint.value, showBackground: true, isMaxOnTop: lineSettings.isMaxOnTop)
        } else {
            return Path.linePathWithPoints(data: data.map({$0.value}), step: step, size: size, minPoint: minPoint.value, maxPoint: maxPoint.value, showBackground: true, isMaxOnTop: lineSettings.isMaxOnTop)
        }
    }
    
    // Actions
    @Binding var touchLocation: CGPoint
    @Binding var showIndicatorDot: Bool
    @Binding var currentValue: LineData
    @Binding var showIndicators: Bool
    
    // Settings
    let blurSettings: LineBlurSettings
    let lineSettings: LineSettings
    let backgroundSettings: LineChartBackgroundSettings
    let indicatorSettings: IndicatorSettings
    
    
    var body: some View {
        ZStack {
//            Rectangle()
//                .fill(.red)
            // Line blur
            if blurSettings.showLineBlur {
                self.path
                    .stroke(blurSettings.lineColor, style: StrokeStyle(lineWidth: blurSettings.lineWidth, lineJoin: .round))
                    .blur(radius: blurSettings.blurRadius)
            }
            // Background Line
            if backgroundSettings.showBackground {
                backgroundPath
                    .fill(backgroundSettings.colors)
            }
            // Line
            self.path
                .stroke(lineSettings.colors, style: StrokeStyle(lineWidth: lineSettings.lineWidth, lineJoin: .round))
                .shadow(radius: lineSettings.shadowRadius)
            if(showIndicatorDot) {
                IndicatorPoint(settings: indicatorSettings)
                    .position(self.getClosestPointOnPath(touchLocation: self.touchLocation))
                    
                    
            }
            /*if showIndicators {
                ForEach(Array(data.enumerated()), id: \.offset) { index, value in
                    Text("1234")
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding(3)
                        .background(.gray)
                        .cornerRadius(4)
                        .position(x: CGFloat(index) * step.x, y: size.height - (value * step.y))
                }
            }*/
        }
        .frame(width: size.width, height: size.height)
        .gesture(DragGesture()
            .onChanged({ value in
                self.touchLocation = value.location
                self.showIndicatorDot = true
                self.getClosestDataPoint()
            })
                .onEnded({ value in
                    self.showIndicatorDot = false
                })
        )
        .cornerRadius(20)
    }
    
    func getClosestPointOnPath(touchLocation: CGPoint) -> CGPoint {
        let closest = path.point(to: touchLocation.x)
        return closest
    }
    
    @discardableResult func getClosestDataPoint() -> CGPoint {
        let index:Int = Int(round((touchLocation.x)/step.x))
        if (index >= 0 && index < data.count){
            self.currentValue = data[index]
            return CGPoint(x: CGFloat(index)*(step.x), y: CGFloat(data[index].value) * step.y)
        }
        return .zero
    }
}

struct Line_Previews: PreviewProvider {
    static var previews: some View {
        Line(data: [LineData(date: "27 jul", value: 0), LineData(date: "28 jul", value: 2), LineData(date: "29 jul", value: 1.5), LineData(date: "30 jul", value: 7), LineData(date: "31 jul", value: 4), LineData(date: "1 aug", value: 0)], size: CGSize(width: 400, height: 200), touchLocation: .constant(.zero), showIndicatorDot: .constant(true), currentValue: .constant(LineData(date: "", value: 0)), showIndicators: .constant(true), blurSettings: LineBlurSettings(), lineSettings: LineSettings(), backgroundSettings: LineChartBackgroundSettings(), indicatorSettings: IndicatorSettings())
    }
}
        
extension Path {
    static func quadCurvedPathWithPoints(data: [Double], step: CGPoint, size: CGSize, minPoint: Double, showBackground: Bool = false, isMaxOnTop: Bool) -> Path {
        var path = Path()
        if data.count < 2 {
            return path
        }
        var p1 = CGPoint(x: 0, y: isMaxOnTop ? size.height - (data[0] - minPoint) * step.y : (data[0] - minPoint) * step.y)
        path.move(to: p1)
        for i in 1..<data.count {
            let p2y = isMaxOnTop ? size.height - (data[i] - minPoint) * step.y : (data[i] - minPoint) * step.y
            let p2x = CGFloat(i) * step.x
            let p2 = CGPoint(x: p2x, y: p2y)
            let midPoint = CGPoint.midPointForPoints(p1: p1, p2: p2)
            path.addQuadCurve(to: midPoint, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p1))
            path.addQuadCurve(to: p2, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p2))
            p1 = p2
        }
        if showBackground {
            path.addLine(to: CGPoint(x: p1.x, y: size.height))
            path.addLine(to: CGPoint(x: 0, y: size.height))
//            path.addLine(to: CGPoint(x: 0, y: size.height - (data[0] - minPoint) * step.y))
        }
        return path
    }
    
    static func getHorizontalGridLine(data: [Double], step: CGPoint, size: CGSize, minPoint: CGFloat, maxPoint: CGFloat) -> Path {
        var path = Path()
        let p1 = CGPoint(x: 0, y: 0)
        path.move(to: p1)
        let p2 = CGPoint(x: size.width, y: 0)
        path.addLine(to: p2)
        return path
    }
    
    static func linePathWithPoints(data: [Double], step: CGPoint, size: CGSize, minPoint: Double, maxPoint: Double, showBackground: Bool = false, isMaxOnTop: Bool) -> Path {
        var path = Path()
        if data.count < 2 {
            return path
        }
        var p1 = CGPoint(x: 0, y: isMaxOnTop ? size.height - (data[0] - minPoint) * step.y : (data[0] - minPoint) * step.y)//
        path.move(to: p1)
        for i in 1..<data.count {
            let p2y = isMaxOnTop ? size.height - (data[i] - minPoint) * step.y : (data[i] - minPoint) * step.y
            let p2x = CGFloat(i) * step.x
            let p2 = CGPoint(x: p2x, y: p2y)
            path.addLine(to: p2)
            p1 = p2
        }
        if showBackground {
            path.addLine(to: CGPoint(x: p1.x, y: size.height))
            path.addLine(to: CGPoint(x: 0, y: size.height))
//            path.addLine(to: CGPoint(x: 0, y: size.height - (data[0] - minPoint) * step.y))
        }
        return path
    }
    
    func point(to maxX: CGFloat) -> CGPoint {
        let total = length
        let sub = length(to: maxX)
        let percent = sub / total
        return point(for: percent)
    }
    
    var length: CGFloat {
        var ret: CGFloat = 0.0
        var start: CGPoint?
        var point = CGPoint.zero
        
        forEach { ele in
            switch ele {
            case .move(let to):
                if start == nil {
                    start = to
                }
                point = to
            case .line(let to):
                ret += point.line(to: to)
                point = to
            case .quadCurve(let to, let control):
                ret += point.quadCurve(to: to, control: control)
                point = to
            case .curve(let to, let control1, let control2):
                ret += point.curve(to: to, control1: control1, control2: control2)
                point = to
            case .closeSubpath:
                if let to = start {
                    ret += point.line(to: to)
                    point = to
                }
                start = nil
            }
        }
        return ret
    }
    
    func length(to maxX: CGFloat) -> CGFloat {
        var ret: CGFloat = 0.0
        var start: CGPoint?
        var point = CGPoint.zero
        var finished = false
        
        forEach { ele in
            if finished {
                return
            }
            switch ele {
            case .move(let to):
                if to.x > maxX {
                    finished = true
                    return
                }
                if start == nil {
                    start = to
                }
                point = to
            case .line(let to):
                if to.x > maxX {
                    finished = true
                    ret += point.line(to: to, x: maxX)
                    return
                }
                ret += point.line(to: to)
                point = to
            case .quadCurve(let to, let control):
                if to.x > maxX {
                    finished = true
                    ret += point.quadCurve(to: to, control: control, x: maxX)
                    return
                }
                ret += point.quadCurve(to: to, control: control)
                point = to
            case .curve(let to, let control1, let control2):
                if to.x > maxX {
                    finished = true
                    ret += point.curve(to: to, control1: control1, control2: control2, x: maxX)
                    return
                }
                ret += point.curve(to: to, control1: control1, control2: control2)
                point = to
            case .closeSubpath:
                fatalError("Can't include closeSubpath")
            }
        }
        return ret
    }
    
    func point(for percent: CGFloat) -> CGPoint {
        let path = trimmedPath(for: percent)
        return CGPoint(x: path.boundingRect.midX, y: path.boundingRect.midY)
    }
    
    func trimmedPath(for percent: CGFloat) -> Path {
        // percent difference between points
        let boundsDistance: CGFloat = 0.001
        let completion: CGFloat = 1 - boundsDistance
        
        let pct = percent > 1 ? 0 : (percent < 0 ? 1 : percent)
        
        let start = pct > completion ? completion : pct - boundsDistance
        let end = pct > completion ? 1 : pct + boundsDistance
        return trimmedPath(from: start, to: end)
    }
}

extension CGPoint {
    static func controlPointForPoints(p1:CGPoint, p2:CGPoint) -> CGPoint {
        var controlPoint = CGPoint.midPointForPoints(p1:p1, p2:p2)
        let diffY = abs(p2.y - controlPoint.y)
        
        if (p1.y < p2.y){
            controlPoint.y += diffY
        } else if (p1.y > p2.y) {
            controlPoint.y -= diffY
        }
        return controlPoint
    }
    
    static func midPointForPoints(p1:CGPoint, p2:CGPoint) -> CGPoint {
        return CGPoint(x:(p1.x + p2.x) / 2,y: (p1.y + p2.y) / 2)
    }
    
    func line(to: CGPoint) -> CGFloat {
        dist(to: to)
    }
    
    func quadCurve(to: CGPoint, control: CGPoint) -> CGFloat {
        var dist: CGFloat = 0
        let steps: CGFloat = 100
        
        for i in 0..<Int(steps) {
            let t0 = CGFloat(i) / steps
            let t1 = CGFloat(i+1) / steps
            let a = point(to: to, t: t0, control: control)
            let b = point(to: to, t: t1, control: control)
            
            dist += a.line(to: b)
        }
        return dist
    }
    
    func line(to: CGPoint, x: CGFloat) -> CGFloat {
        dist(to: point(to: to, x: x))
    }
    
    func quadCurve(to: CGPoint, control: CGPoint, x: CGFloat) -> CGFloat {
        var dist: CGFloat = 0
        let steps: CGFloat = 100
        
        for i in 0..<Int(steps) {
            let t0 = CGFloat(i) / steps
            let t1 = CGFloat(i+1) / steps
            let a = point(to: to, t: t0, control: control)
            let b = point(to: to, t: t1, control: control)
            
            if a.x >= x {
                return dist
            } else if b.x > x {
                dist += a.line(to: b, x: x)
                return dist
            } else if b.x == x {
                dist += a.line(to: b)
                return dist
            }
            
            dist += a.line(to: b)
        }
        return dist
    }
    
    func curve(to: CGPoint, control1: CGPoint, control2: CGPoint) -> CGFloat {
        var dist: CGFloat = 0
        let steps: CGFloat = 100
        
        for i in 0..<Int(steps) {
            let t0 = CGFloat(i) / steps
            let t1 = CGFloat(i+1) / steps
            
            let a = point(to: to, t: t0, control1: control1, control2: control2)
            let b = point(to: to, t: t1, control1: control1, control2: control2)
            
            dist += a.line(to: b)
        }
        
        return dist
    }
    
    func curve(to: CGPoint, control1: CGPoint, control2: CGPoint, x: CGFloat) -> CGFloat {
        var dist: CGFloat = 0
        let steps: CGFloat = 100
        
        for i in 0..<Int(steps) {
            let t0 = CGFloat(i) / steps
            let t1 = CGFloat(i+1) / steps
            
            let a = point(to: to, t: t0, control1: control1, control2: control2)
            let b = point(to: to, t: t1, control1: control1, control2: control2)
            
            if a.x >= x {
                return dist
            } else if b.x > x {
                dist += a.line(to: b, x: x)
                return dist
            } else if b.x == x {
                dist += a.line(to: b)
                return dist
            }
            
            dist += a.line(to: b)
        }
        
        return dist
    }
    
    func dist(to: CGPoint) -> CGFloat {
        return sqrt((pow(self.x - to.x, 2) + pow(self.y - to.y, 2)))
    }
    
    func point(to: CGPoint, t: CGFloat, control: CGPoint) -> CGPoint {
        let x = CGPoint.value(x: self.x, y: to.x, t: t, c: control.x)
        let y = CGPoint.value(x: self.y, y: to.y, t: t, c: control.y)
        
        return CGPoint(x: x, y: y)
    }
    
    func point(to: CGPoint, t: CGFloat, control1: CGPoint, control2: CGPoint) -> CGPoint {
        let x = CGPoint.value(x: self.x, y: to.x, t: t, c1: control1.x, c2: control2.x)
        let y = CGPoint.value(x: self.y, y: to.y, t: t, c1: control1.y, c2: control2.x)
        
        return CGPoint(x: x, y: y)
    }
    
    static func value(x: CGFloat, y: CGFloat, t: CGFloat, c: CGFloat) -> CGFloat {
        var value: CGFloat = 0.0
        // (1-t)^2 * p0 + 2 * (1-t) * t * c1 + t^2 * p1
        value += pow(1-t, 2) * x
        value += 2 * (1-t) * t * c
        value += pow(t, 2) * y
        return value
    }
    
    static func value(x: CGFloat, y: CGFloat, t: CGFloat, c1: CGFloat, c2: CGFloat) -> CGFloat {
        var value: CGFloat = 0.0
        // (1-t)^3 * p0 + 3 * (1-t)^2 * t * c1 + 3 * (1-t) * t^2 * c2 + t^3 * p1
        value += pow(1-t, 3) * x
        value += 3 * pow(1-t, 2) * t * c1
        value += 3 * (1-t) * pow(t, 2) * c2
        value += pow(t, 3) * y
        return value
    }
    
    func point(to: CGPoint, x: CGFloat) -> CGPoint {
        let a = (to.y - self.y) / (to.x - self.x)
        let y = self.y + (x - self.x) * a
        return CGPoint(x: x, y: y)
    }
}
