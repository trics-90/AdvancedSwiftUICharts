//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 13.12.23.
//

import SwiftUI

public struct ProgressChartRow: View {
    // Calues
    let data: Double
    let targets: [Double]!
    @State var scaleValue: CGFloat = 0
    
    // Dimensions
    let targetWidth: CGFloat = 5
    let barHeight: CGFloat = 15
    
    // Styles
    var achivedTargetColor: Color = .white
    var previousTargetColor: Color = .white
    var markColor: Color = .clear
    var showTargets: Bool = true
    
    
    public var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            let progressBarWidth = width * data
            
            
            VStack(spacing: 0) {
                if targets != nil {
                    HStack(alignment: .bottom) {
                        ForEach(Array(targets.enumerated()), id: \.offset) { index, target in
                            Text("\(Int(target * 100))%")
                                .font(index == (targets.count - 1) || index == 0 ? .callout.bold() : .caption2)
                                .multilineTextAlignment(.center)
                            if index != (targets.count - 1) {
                                Spacer()
                            }
                        }
                    }
                }
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
                }
                .cornerRadius(6)
                Text("\(Int(data * 100))%")
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(2)
                    .background(markColor)
                    .cornerRadius(5)
                    .position(x: width * data)
                    .padding(.top, 10)
            }
            .onAppear {
                withAnimation(.easeOut(duration: 0.5)) {
                    self.scaleValue = progressBarWidth
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
    }
    
    private func getTargetPosition(barWidth: CGFloat, for target: Double, i: Int) -> CGFloat {
        let offset = self.targetWidth / 2 - (CGFloat(i + 1) * targetWidth)
        let xPosition = barWidth * target + offset
        return xPosition
    }
    

}

struct ProgressChartRow_Previews: PreviewProvider {
    static var previews: some View {
        ProgressChartRow(data: 0.43, targets: [0.0, 0.25, 0.5, 0.75, 1.0])
    }
}
