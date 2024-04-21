//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 12.12.23.
//

import SwiftUI

public struct BarChartRow: View {
    public var data: [Double]
    public let settings: BarChartSettings
    let width: CGFloat
    
    var maxValue: Double {
        guard let max = data.max() else {
            return 1
        }
        return max != 0 ? max : 1
    }
    
    var step: CGFloat {
        var x: CGFloat = 0
        
        if data.count < 2 {
            x = 0
        } else {
            x = width / CGFloat(data.count - 1)
        }
        
        return x
    }
    
    
    @State var touchLocation: CGFloat = .zero
    @Binding var showIndicator: Bool
    @Binding var currentValue: Double
    @State var currentIndex: Int? = nil
    public var body: some View {
        GeometryReader { proxy in
            let width = proxy.frame(in: .local).width
            let height = proxy.size.height
            let spacing = (width / CGFloat(data.count - 1)) * settings.barWidthMultiplier
            let barWidth = (width / CGFloat(data.count)) * (1 - settings.barWidthMultiplier)
            let cornerRadius = barWidth * (settings.cornerRadiusMultiplier / 2)
            
            HStack(alignment: .bottom, spacing: spacing) {
                ForEach(Array(data.enumerated()), id: \.offset) { index, element in
                    Bar(width: barWidth, height: (height * getHeightMultiplier(for: element)) - 0, value: element, color: getColorAccent(value: element), blur: 5, cornerRadius: cornerRadius, isSelected: self.currentIndex == index ? true : false)
                }
            }
        }
        .gesture(DragGesture()
            .onChanged { value in
                self.touchLocation = value.location.x
                self.showIndicator = true
                self.getClosestDataPoint()
            }
            .onEnded({ value in
                self.showIndicator = false
                self.currentIndex = nil
            })
        )
        
        
        /*
        .gesture(DragGesture()
            .onChanged({ value in
                self.touchLocation = value.location.x/self.formSize.width
                self.showValue = true
                self.currentValue = self.getCurrentValue()?.1 ?? 0
                if(self.data.valuesGiven && self.formSize == ChartForm.medium) {
                    self.showLabelValue = true
                }
            })
            .onEnded({ value in
                if animatedToBack {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation(Animation.easeOut(duration: 1)) {
                            self.showValue = false
                            self.showLabelValue = false
                            self.touchLocation = -1
                        }
                    }
                } else {
                    self.showValue = false
                    self.showLabelValue = false
                    self.touchLocation = -1
                }
            })
    )
         */
//        .frame(maxWidth: .infinity)
    }
    
    @discardableResult func getClosestDataPoint() -> CGFloat {
        let index: Int = Int(round((touchLocation)/step))
        if (index >= 0 && index < data.count){
            self.currentValue = data[index]
            self.currentIndex = index
            return CGFloat(index) * (step)
        }
        return .zero
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
            return self.settings.maxBarColor
        } else if value == minValue {
            return self.settings.minBarColor
        } else {
            return self.settings.mediumBarColor
        }
    }
    
    private func getBarBlur(value: Double) -> CGFloat? {
        guard let maxValue = self.data.max() else {
            return nil
        }
        guard let minValue = self.data.min() else {
            return nil
        }
        if value == maxValue {
            return self.settings.maxBarBlur
        } else if value == minValue {
            return self.settings.minBarBlur
        } else {
            return self.settings.mediumBarBlur
        }
    }
    
    
}

#if DEBUG
struct ChartRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            BarChartView(data: [1.0, 2.0, 5.0, 3.0, 7.5, 9.5, 5.0, 10.0, 6.0, 11.0, 2.0, 1.0, 3.0, 1.0, 2.0, 5.0, 3.0, 7.5], settings: BarChartSettings(title: "Активность"))
        }
        .frame(height: 200)
        .padding()
    }
}
#endif
