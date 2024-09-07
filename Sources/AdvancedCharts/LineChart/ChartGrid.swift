//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 16.12.23.
//

import SwiftUI

//struct ChartGrid: View {
//    // Values
//    let data: [Double]
//    
//    // Dimensions
//    let size: CGSize
//    let step: CGPoint
//    
//    // Settings
//    let settings: LineChartSettings
//    var body: some View {
//        ZStack(alignment: .topLeading) {
//            ForEach(getLinePoints(numberOfLines: settings.numberOfHorizontalGridLines), id: \.self) { linePoint in
//                HStack(alignment: .center) {
//                    Text(String(Int(linePoint)))
//                        .font(.caption)
//                        .foregroundColor(.gray)
//                        .position(x: 20, y: settings.isMaxValueOnTop ? size.height - (linePoint - 1) * step.y : (linePoint - 1) * step.y)
//                        .frame(width: 30)
//                    getHorizontalGridLine(linePoint: linePoint)
//                        .stroke(.gray, style: StrokeStyle(lineWidth: 0.5, dash: [5, 10]))
//                }
//            }
//        }
//    }
//    
//    func getLinePoints(numberOfLines: Int) -> [Double] {
//        var dataLinePoints: [Double] = []
//        guard let linePoints = settings.linePoints else {
//
//            guard let minLinePoint = data.min() else {
//                return [0]
//            }
//            for i in 0...numberOfLines - 1 {
//                dataLinePoints.append(minLinePoint + CGFloat(i) * step.y)
//            }
//            return dataLinePoints
//        }
//        return linePoints
//    }
//    
//    func getHorizontalGridLine(linePoint: Double) -> Path {
//        var path = Path()
//        path.move(to: CGPoint(x: 0, y: settings.isMaxValueOnTop ? size.height - (linePoint - 1) * step.y : (linePoint - 1) * step.y))
//        path.addLine(to: CGPoint(x: size.width, y: settings.isMaxValueOnTop ? (size.height - (linePoint - 1) * step.y) : (linePoint - 1) * step.y))
//        return path
//    }
//    
//}
//
//struct ChartGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        ChartGrid(data: [5, 10, 8, 9, 3, 15, 14, 18, 14, 12, 7, 2, 1], size: CGSize(width: 400, height: 200), step: CGPoint(x: 1, y: 5), settings: LineChartSettings(title: "Discofox Analytics", gradientColor: LinearGradient(colors: [Color(hexString: "0097F7"), Color(hexString: "D200D4")], startPoint: .bottom, endPoint: .top)))
//    }
//}
