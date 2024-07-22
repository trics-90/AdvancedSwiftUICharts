//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 12.07.2024.
//

import SwiftUI

struct RatingChartRow: View {
    let settings: RatingChartSettings
    let size: CGSize
    let data: [RatingData]
    let yTargets: [Int] = [1, 5, 10, 15, 20, 25, 30]
    
    var xTargets: [String] {
        let targets = data.compactMap({$0.description})
        return targets
    }
        
    var maxValue: RatingData {
        guard let maxValue = self.data.max(by: {$0.value > $1.value}) else {
            return RatingData(value: 0, description: "N/D")
        }
        return maxValue
    }
    
    var minValue: RatingData {
        guard let minValue = self.data.min(by: {$0.value < $1.value}) else {
            return RatingData(value: 0, description: "N/D")
        }
        return minValue
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            PlacesLegend(settings: settings, yTargets: yTargets, xTargets: xTargets, height: size.height, width: size.width, data: data)
//            Rectangle()
//                .frame(width: size.width - 20, height: size.height - 30)
        }
    }
}

#Preview {
    ZStack(alignment: .bottomLeading) {
        RatingChartRow(settings: RatingChartSettings(title: "Rating Chart"), size: CGSize(width: 370, height: 170), data: [
            RatingData(value: 30, description: "Jul 23"),
            RatingData(value: 28, description: "Aug 23"),
            RatingData(value: 23, description: "Sep 23"),
            RatingData(value: 25, description: "Oct 23"),
            RatingData(value: 20, description: "Nov 23"),
            RatingData(value: 20, description: "Dec 23"),
            RatingData(value: 23, description: "Jan 24"),
            RatingData(value: 24, description: "Feb 24"),
            RatingData(value: 15, description: "Mar 24"),
            RatingData(value: 10, description: "Apr 24"),
            RatingData(value: 11, description: "May 24"),
            RatingData(value: 11, description: "Jun 24"),
        ])
            .frame(height: 170)
    }
}

fileprivate struct PlacesLegend: View {
    let settings: RatingChartSettings
    let yTargets: [Int]
    let xTargets: [String]
    let height: CGFloat
    let width: CGFloat
    let data: [RatingData]
    
    var step: CGPoint {
        guard let maxTarget = yTargets.max() else {
            return CGPoint(x: 0, y: 0)
        }
        let yStep = (height - settings.horizontalLegendHeight) / Double(maxTarget)
        let xStep = (width) / Double(xTargets.count)
        let step = CGPoint(x: xStep, y: yStep)
        return step
        
    }
    
    var maxYTarget: Int {
        guard let maxTarget = yTargets.max() else {
            return 0
        }
        return maxTarget
    }
        
    var body: some View {
        ZStack(alignment: .topLeading) {
            ForEach(yTargets, id: \.self) { target in
//                HStack(alignment: .bottom) {
                    Text("\(target)")
                        .font(.system(size: 8))
                        .foregroundStyle(.white)
                        .position(x: 10.0, y: step.y * Double(target))
                        .frame(width: settings.verticalLegendWidth)
                    Path { path in
                        path.move(to: CGPoint(x: settings.verticalLegendWidth, y: step.y * Double(target)))
                        path.addLine(to: CGPoint(x: width, y: step.y * Double(target)))
                    }
                    .strokedPath(StrokeStyle(lineWidth: settings.gridLineWidth, lineCap: .round, lineJoin: .bevel, dash: [2], dashPhase: 5))
                    .fill(settings.gridColor)
//                }
            }
            ForEach(Array(xTargets.enumerated()), id: \.offset) { i, target in
                Text(target)
                    .font(.system(size: 8))
                    .multilineTextAlignment(.center)
                    .frame(width: 20)
                    .foregroundStyle(settings.horizontalLegendColor)
                    .position(x: settings.verticalLegendWidth + step.x * Double(i), y: height - 10)
            }
            getPath()
                .stroke(lineWidth: settings.lineWidth)
        }
    }
    
    private func getPath() -> Path {
        var path = Path()
        if self.data.count < 2 {
            return path
        }
        let p0y = Double(self.data[0].value) * self.step.y
        let p0x = self.settings.verticalLegendWidth
        let p0 = CGPoint(x: p0x, y: p0y)
        path.move(to: p0)
        
        for i in 1..<self.data.count {
            if self.data[i].value > self.maxYTarget {
                let px = self.settings.verticalLegendWidth + Double(i) * self.step.x
                let py = Double(self.maxYTarget) * self.step.y
                let p = CGPoint(x: px, y: py)
                path.move(to: p)
                continue
//                let py = self.step.y * Double(self.data[i].value)
            }
            let px = self.settings.verticalLegendWidth + Double(i) * self.step.x
            let py = self.step.y * Double(self.data[i].value)
            let p = CGPoint(x: px, y: py)
            path.addLine(to: p)
        }
        return path
    }
}

fileprivate struct HorizontalLegend: View {
    let size: CGSize
    let legendWidth: CGFloat
    let legendHeight: CGFloat
    let xOffset: CGFloat = 30
    
    let targets: [String]
    
    var xStep: CGFloat {
        let step = size.width / Double(targets.count)
        return step
    }
    var body: some View {
        ZStack {
            ForEach(Array(targets.enumerated()), id: \.offset) { i, target in
                Text(target)
                    .font(.system(size: 8))
                    .multilineTextAlignment(.center)
//                    .frame(width: 17)
                    .foregroundStyle(.white)
                    .position(x: xOffset + xStep * Double(i), y: size.height - 10)
            }
        }
//        .padding(.leading, 15)
        .frame(width: size.width, height: size.height)
    }
}

fileprivate struct RatingLine: View {
    var body: some View {
        Text("")
    }
}
