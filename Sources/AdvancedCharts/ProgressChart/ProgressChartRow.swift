//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 13.12.23.
//

import SwiftUI

public struct ProgressChartRow: View {
    // Calues
    var progress: Double = 0.5
    var targets: [Double] = [0.15, 0.30, 0.5, 0.6, 0.75, 1.0]
    @State var scaleValue: CGFloat = 0
    
    // Dimensions
    let targetWidth: CGFloat = 5
    let barHeight: CGFloat = 15
    
    // Styles
    var achivedTargetColor: Color = .white
    var previousTargetColor: Color = .white
    var markColor: Color = .clear
    var showTargets: Bool = false
    
    
    public var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            let progressBarWidth = width * progress
            
            
            VStack {
                Text("\(Int(progress * 100))%")
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(2)
                    .background(markColor)
                    .cornerRadius(5)
                    .position(x: width * progress)
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(.gray)
                        .frame(width: width, height: barHeight)
                    RoundedRectangle(cornerRadius: 6)
                        .fill(LinearGradient(colors: [.orange, .yellow], startPoint: .leading, endPoint: .trailing))
//                        .fill(.red)
                        .frame(width: scaleValue, height: barHeight)
                        .blur(radius: 5)
                    RoundedRectangle(cornerRadius: 6)
                        .fill(LinearGradient(colors: [.orange, .yellow], startPoint: .leading, endPoint: .trailing))
                        .frame(width: scaleValue, height: barHeight)
//                        .blur(radius: 10)
                    if showTargets {
                        HStack(spacing: 0) {
                            ForEach(Array(targets.enumerated()), id: \.offset) { index, target in
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(progress > target ? achivedTargetColor : previousTargetColor)
                                    .position(x: getTargetPosition(barWidth: width, for: target, i: index), y: barHeight / 2)
                                    .frame(width: targetWidth, height: barHeight)
                            }
                        }
                    }
                }
                .cornerRadius(6)
            }
            .onAppear {
                withAnimation(.easeOut(duration: 0.5)) {
                    self.scaleValue = progressBarWidth
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 25)
    }
    
    private func getTargetPosition(barWidth: CGFloat, for target: Double, i: Int) -> CGFloat {
        let offset = self.targetWidth / 2 - (CGFloat(i + 1) * targetWidth)
        let xPosition = barWidth * target + offset
        return xPosition
    }
    

}

struct ProgressChartRow_Previews: PreviewProvider {
    static var previews: some View {
        ProgressChartRow()
    }
}
