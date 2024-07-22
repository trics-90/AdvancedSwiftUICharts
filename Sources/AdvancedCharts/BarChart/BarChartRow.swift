//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 12.12.23.
//

import SwiftUI

public struct BarChartRow: View {
//    var data: [Double]
    let data: [BarData]
    let barSettings: BarSettings
    let width: CGFloat
    
    var maxValue: Double {
        guard let max = data.max(by: {$0.value > $1.value}) else {
            return 1
        }
        return max.value != 0 ? max.value : 1
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
    @Binding var currentValue: BarData
    @State var currentIndex: Int? = nil
    public var body: some View {
        GeometryReader { proxy in
            let width = proxy.frame(in: .local).width
            let height = proxy.size.height
            let spacing = (width / CGFloat(data.count - 1)) * barSettings.barWidthMultiplier
            let barWidth = (width / CGFloat(data.count)) * (1 - barSettings.barWidthMultiplier)
            let cornerRadius = barWidth * (barSettings.cornerRadiusMultiplier / 2)
            
            HStack(alignment: .bottom, spacing: spacing) {
                ForEach(Array(data.enumerated()), id: \.offset) { index, element in
                    Bar(width: barWidth, height: (height * getHeightMultiplier(for: element.value)) - 0, value: element, color: getColorAccent(value: element.value), blur: 5, cornerRadius: cornerRadius, isSelected: self.currentIndex == index ? true : false)
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
        guard let maxValue = self.data.max(by: {$0.value < $1.value}) else {
            return 0.0
        }
        let multiplier = item / maxValue.value
        return multiplier
    }
    
    private func normalizedValue(index: Int) -> Double {
        return Double(self.data[index].value)/Double(self.maxValue)
    }
    
    private func getColorAccent(value: Double) -> Color? {
        guard let maxValue = self.data.max(by: {$0.value < $1.value}) else {
            return nil
        }
        guard let minValue = self.data.min(by: {$0.value < $1.value}) else {
            return nil
        }
        if value == maxValue.value {
            return self.barSettings.maxBarColor
        } else if value == minValue.value {
            return self.barSettings.minBarColor
        } else {
            return self.barSettings.mediumBarColor
        }
    }
    
    private func getBarBlur(value: Double) -> CGFloat? {
        guard let maxValue = self.data.max(by: {$0.value > $1.value}) else {
            return nil
        }
        guard let minValue = self.data.min(by: {$0.value < $1.value}) else {
            return nil
        }
        if value == maxValue.value {
            return self.barSettings.maxBarBlur
        } else if value == minValue.value {
            return self.barSettings.minBarBlur
        } else {
            return self.barSettings.mediumBarBlur
        }
    }
    
    
}

#if DEBUG
struct ChartRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            BarChartView(settings: BarChartSettings(titleSettings: BarChartTitleSettings(title: "Bar Chart Settings")), data: [
                BarData(value: 7, title: "Jan"),
                BarData(value: 9, title: "Feb"),
                BarData(value: 4, title: "Mar"),
                BarData(value: 5, title: "Apr"),
                BarData(value: 4, title: "May"),
                BarData(value: 9, title: "Jun"),
                BarData(value: 6, title: "Jul"),
                BarData(value: 8, title: "Aug"),
                BarData(value: 9, title: "Sep"),
                BarData(value: 6, title: "Oct"),
                BarData(value: 10, title: "Nov"),
                BarData(value: 6, title: "Dec")
            ])
        }
        .frame(height: 200)
        .padding()
    }
}
#endif


public struct BarData: Hashable {
    public let value: Double
    public let title: String
    
    public init(value: Double, title: String) {
        self.value = value
        self.title = title
    }
}
