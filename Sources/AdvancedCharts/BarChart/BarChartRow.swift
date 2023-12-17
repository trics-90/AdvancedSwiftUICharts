//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 12.12.23.
//

import SwiftUI
/*
public struct BarChartRow2 : View {
    var data: [Double]
    var accentColor: Color
    var gradient: GradientColor?
    
    var maxValue: Double {
        guard let max = data.max() else {
            return 1
        }
        return max != 0 ? max : 1
    }
    @Binding var touchLocation: CGFloat
    public var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .bottom, spacing: (geometry.frame(in: .local).width-22)/CGFloat(self.data.count * 3)){
                ForEach(0..<self.data.count, id: \.self) { i in
                    BarChartCell(value: self.normalizedValue(index: i),
                                 index: i,
                                 width: Float(geometry.frame(in: .local).width - 22),
                                 numberOfDataPoints: self.data.count,
                                 accentColor: self.accentColor,
                                 gradient: self.gradient,
                                 touchLocation: self.$touchLocation)
                        .scaleEffect(self.touchLocation > CGFloat(i)/CGFloat(self.data.count) && self.touchLocation < CGFloat(i+1)/CGFloat(self.data.count) ? CGSize(width: 1.4, height: 1.1) : CGSize(width: 1, height: 1), anchor: .bottom)
                        .animation(.spring())
                    
                }
            }
            .padding([.top, .leading, .trailing], 10)
        }
    }
    
    func normalizedValue(index: Int) -> Double {
        return Double(self.data[index])/Double(self.maxValue)
    }
}
*/


#if DEBUG
struct ChartRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            BarChartRow(data: [1.0, 2.0, 5.0, 3.0, 7.5, 9.5, 5.0, 10.0, 6.0])
        }
    }
}
#endif

 

public struct BarChartRow: View {
    var data: [Double]
    
    let widthMultiplier = 0.2
    let cornerRadiusMultiplier = 0.25
    
    
    var maxValue: Double {
        guard let max = data.max() else {
            return 1
        }
        return max != 0 ? max : 1
    }
    public var body: some View {
        GeometryReader { proxy in
            let width = proxy.frame(in: .local).width
            let height = proxy.size.height
            let spacing = (width / CGFloat(data.count - 1)) * widthMultiplier
            let barWidth = (width / CGFloat(data.count)) * (1 - widthMultiplier)
            let cornerRadius = barWidth * cornerRadiusMultiplier
            
            HStack(alignment: .bottom, spacing: spacing) {
                ForEach(data, id: \.self) { i in
                    Bar(width: barWidth, height: (height * getHeightMultiplier(for: i)) - 0, value: i, color: getColorAccent(value: i), blur: 5, cornerRadius: cornerRadius)
                }
            }
        }
//        .frame(maxWidth: .infinity)
    }
    
    private func getHeightMultiplier(for item: Double) -> Double {
        guard let maxValue = self.data.max() else {
            return 0.0
        }
        let multiplier = item / maxValue
        return multiplier
    }
    
    private func normalizedValue(index: Int) -> Double {
        return Double(self.data[index])/Double(self.maxValue)
    }
    
    private func getColorAccent(value: Double) -> Color? {
        guard let maxValue = self.data.max() else {
            return nil
        }
        guard let minValue = self.data.min() else {
            return nil
        }
        if value == maxValue {
            return .red
        } else if value == minValue {
            return .blue
        } else {
            return .gray
        }
    }
}

