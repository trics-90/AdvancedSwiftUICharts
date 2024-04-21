//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 12.12.23.
//

import SwiftUI

public struct Bar: View {
    // Dimensions
    var width: CGFloat
    var height: CGFloat
    @State var scaleValue: Double = 0
    
    // Values
    let value: BarData
//    var value: Double
    
    // Style
    var color: Color?
    var blur: CGFloat?
    var cornerRadius: CGFloat?
    
    let isSelected: Bool
    
    public var body: some View {
        VStack(spacing: 5) {
            Text("\(Int(value.value))")
                .font(.caption)
                .fontWeight(.bold)
//                .frame(height: 10)
            ZStack {
                if blur != nil {
                    RoundedRectangle(cornerRadius: cornerRadius ?? 3)
                        .fill(color ?? .red)
                        .blur(radius: blur!)
                }
                RoundedRectangle(cornerRadius: cornerRadius ?? 3)
                    .fill(color ?? .red)
                if isSelected {
                    RoundedRectangle(cornerRadius: cornerRadius ?? 3)
                        .fill(.white.opacity(0.2))
                        .cornerRadius(cornerRadius ?? 3)
                }
                    
            }
//            .frame(width: width)
            .frame(height: scaleValue)
            .onAppear {
                withAnimation(.easeOut(duration: 0.5)) {
                    self.scaleValue = self.height
                }
            }
        }
    }
}

#if DEBUG
struct Bar_Previews : PreviewProvider {
    static var previews: some View {
//        Bar(width: 20, height: 200, value: 320, blur: 5, isSelected: false)
        Bar_New(isSelected: false, value: 7.8, cornerRadius: 5, height: 60, color: .red)
            .frame(width: 30)
    }
}
#endif

/*
public struct BarChartCell : View {
    var value: Double
    var index: Int = 0
    var width: Float
    var numberOfDataPoints: Int
    var cellWidth: Double {
        return Double(width)/(Double(numberOfDataPoints) * 1.5)
    }
    var accentColor: Color
    var gradient: GradientColor?
    
    @State var scaleValue: Double = 0
    @Binding var touchLocation: CGFloat
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(LinearGradient(gradient: gradient?.getGradient() ?? GradientColor(start: accentColor, end: accentColor).getGradient(), startPoint: .bottom, endPoint: .top))
            }
            .frame(width: CGFloat(self.cellWidth))
            .scaleEffect(CGSize(width: 1, height: self.scaleValue), anchor: .bottom)
            .onAppear(){
                self.scaleValue = self.value
            }
        .animation(Animation.spring().delay(self.touchLocation < 0 ?  Double(self.index) * 0.04 : 0))
    }
}
*/

public struct Bar_New: View {
    let isSelected: Bool
    let value: Double
    let cornerRadius: CGFloat
    let height: CGFloat
    let color: Color
    @State var scaleValue: Double = 0
    public var body: some View {
        VStack {
            // Показатель
            Text("\(Int(value))")
                .fontWeight(.bold)
            // Rectangle
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(.red)
                    .blur(radius: 20)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(.red)
                if isSelected {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(.white.opacity(0.2))
                }
            }
            .frame(height: scaleValue)
            .onAppear {
                withAnimation(.easeOut(duration: 0.5)) {
                    self.scaleValue = self.height
                }
            }
        }
    }
}
